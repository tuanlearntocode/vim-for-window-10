# vim-for-window-10
# Đây là phiên bản cho vim cho win 10

- Tải **Vim x64** theo đường link sau https://tuxproject.de/projects/vim
- Giả sử mình giải nén vào **F:/Vim**, sau đó tải file <i>_vimrc</i> và <i>_gvimrc</i> về chung thư mục với vimx64 vừa giải nén. Tức là **F:/Vim**
- Cài đặt <a href="https://nodejs.org/en/download/">Nodejs<a> để có được code completion
- Cài đặt thêm <a href="https://www.python.org/downloads/">python3<a>
- Cài đặt thêm <a href="https://git-scm.com/download/win">git<a> nữa là oke
# Cài đặt Plugin
- Tải Plugin manager, ở đây mình sử dụng <a href="https://github.com/junegunn/vim-plug">vim-Plug</a>
- Sau đó, giải nén và bỏ file <b>plug.vim</b> vào file **F:/Vim/autoload**
- Tiếp theo mở gvim lên và gõ **:PlugInstall** để tiến hành cài các plugin
# Cài đặt theme dracula
- Vô F:/Vim/plugged/dracula
- Copy lần lượt **dracula.vim** trong autoload và colors của **F:/Vim/plugged/dracula** bỏ vào autoload và colors trong **F:/Vim**
# Markdown preview vim
- Nếu gõ lệnh `:MarkdownPreview` mà không thấy gì xảy ra thì vào *Vim* gõ `:call mkdp#util#install()` và chờ nó cài xong là được

# Goodluck 😋😋😋
