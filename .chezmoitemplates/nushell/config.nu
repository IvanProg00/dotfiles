$env.config = {
    show_banner: false
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    rm: {
        always_trash: false
    }
    table: {
        mode: rounded
        index_mode: always
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false
    }
    error_style: "fancy"
    explore: {
        status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
        command_bar_text: {fg: "#C4C9C6"},
        highlight: {fg: "black", bg: "yellow"},
        status: {
            error: {fg: "white", bg: "red"},
            warn: {}
            info: {}
        },
        table: {
            split_line: {fg: "#404040"},
            selected_cell: {bg: light_blue},
            selected_row: {},
            selected_column: {},
        },
    }
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
        external: {
            enable: true
            max_results: 100
            completer: null
        }
    }
    filesize: {
        metric: true
        format: "auto"
    }
    cursor_shape: {
        emacs: line
        vi_insert: block
        vi_normal: underscore
    }
    footer_mode: "25"
    float_precision: 3
    buffer_editor: ""
    use_ansi_coloring: true
    bracketed_paste: true
    edit_mode: vi
    render_right_prompt_on_last_line: false
    use_kitty_protocol: false
    highlight_resolved_externals: false
}

### Alias ###
use ($nu.default-config-dir | path join "aliases") *

### Completions ###
use ($nu.default-config-dir | path join "completions") *

### Atuin ###
source ~/.local/share/atuin/init.nu

### StarShip ###
use ~/.cache/starship/init.nu

### Zoxide ###
source ~/.zoxide.nu

