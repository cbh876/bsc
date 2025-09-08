use std::env;
use std::fs;
use std::path::{Path, PathBuf};

fn main() {
    // 导出 revmc 内置符号（内置预编译、环境等）
    revmc_build::emit();

    // 静态链接 AOT 对象
    cc::Build::new()
        .object("/Users/constbh/gocode/bsc/aot_out/custom/a.o")
        .static_flag(true)
        .compile("user_contract");

    // 让 rustc 在 OUT_DIR 查找 user_contract 静态库
    println!("cargo:rustc-link-lib=static=user_contract");
    println!(
        "cargo:rustc-link-search=native={}",
        env::var("OUT_DIR").unwrap()
    );

    // 将 librevmc_builtins-*.rlib 复制为 target/<profile>/librevmc_builtins.a，便于 Go 的 cc 查找
    let manifest_dir = PathBuf::from(env::var("CARGO_MANIFEST_DIR").unwrap());
    let profile = env::var("PROFILE").unwrap_or_else(|_| "release".into());
    let target_dir = manifest_dir.join("target").join(&profile);
    let deps_dir = target_dir.join("deps");
    if let Ok(entries) = fs::read_dir(&deps_dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if let Some(name) = path.file_name().and_then(|s| s.to_str()) {
                if name.starts_with("librevmc_builtins-") && name.ends_with(".rlib") {
                    let dest = target_dir.join("librevmc_builtins.a");
                    // 直接复制为 .a（.rlib 是 ar 归档，ld 可当作 .a 使用）
                    let _ = fs::copy(&path, &dest);
                    // 告诉 rustc 也搜索该目录，虽然主要是给 Go 链接使用
                    println!("cargo:rustc-link-search=native={}", target_dir.display());
                    break;
                }
            }
        }
    }
}
