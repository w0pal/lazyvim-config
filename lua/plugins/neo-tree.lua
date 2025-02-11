return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,         -- Pastikan semua file tampil (meskipun "disembunyikan", mereka tetap ditampilkan dengan tampilan yang berbeda)
        hide_dotfiles = false,  -- File yang diawali titik (dotfiles) tidak disembunyikan
        hide_gitignored = true, -- Opsional: file yang diabaikan oleh git tetap disembunyikan
      },
    },
  },
}
