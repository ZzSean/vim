For general, see [Vim for Myself - 张政的博客 | Zz Blog (zzsean.github.io)](https://zzsean.github.io/2021/03/10/vim-final/)

# Difference in docker

## Vim7

**只能使用 neocomplete**

1. 先安装 lua，apt install vim-nox;
2. 下载 neocomplete，[Shougo/neocomplete.vim: Next generation completion framework after neocomplcache (github.com)](https://github.com/Shougo/neocomplete.vim)
3. 将 autoload 移动到 ～/.vim/autoload，将 plugin 移动到 ～/.vim/plugin（若无，需创建文件夹）

**cuda 语法高亮**

将 cu.vim.txt 放到 /usr/share/vim/vim*/syntax，改名为 cu.vim

  ```
  au BufNewFile,BufRead *.cu set ft=cu
  au BufNewFile,BufRead *.cuh set ft=cu
  ```

## Theme

colorscheme desert

