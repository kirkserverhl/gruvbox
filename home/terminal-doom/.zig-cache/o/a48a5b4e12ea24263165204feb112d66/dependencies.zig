pub const packages = struct {
    pub const @"122055beff332830a391e9895c044d33b15ea21063779557024b46169fb1984c6e40" = struct {
        pub const build_root = "/home/kirk/.cache/zig/p/122055beff332830a391e9895c044d33b15ea21063779557024b46169fb1984c6e40";
        pub const build_zig = @import("122055beff332830a391e9895c044d33b15ea21063779557024b46169fb1984c6e40");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"1220c53b75e66a6558c900c36349d835429345999428291a244862c9ac54763f695f" = struct {
        pub const build_root = "/home/kirk/.cache/zig/p/1220c53b75e66a6558c900c36349d835429345999428291a244862c9ac54763f695f";
        pub const build_zig = @import("1220c53b75e66a6558c900c36349d835429345999428291a244862c9ac54763f695f");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "zigimg", "1220dd654ef941fc76fd96f9ec6adadf83f69b9887a0d3f4ee5ac0a1a3e11be35cf5" },
            .{ "zg", "122055beff332830a391e9895c044d33b15ea21063779557024b46169fb1984c6e40" },
        };
    };
    pub const @"1220dd654ef941fc76fd96f9ec6adadf83f69b9887a0d3f4ee5ac0a1a3e11be35cf5" = struct {
        pub const build_root = "/home/kirk/.cache/zig/p/1220dd654ef941fc76fd96f9ec6adadf83f69b9887a0d3f4ee5ac0a1a3e11be35cf5";
        pub const build_zig = @import("1220dd654ef941fc76fd96f9ec6adadf83f69b9887a0d3f4ee5ac0a1a3e11be35cf5");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "vaxis", "1220c53b75e66a6558c900c36349d835429345999428291a244862c9ac54763f695f" },
};
