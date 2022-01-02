# vim-for-window-10
# Đây là phiên bản cho vim cho win 10

# Giả sử thư mục mình cài vim là **F:\Vim**  
🧨🧨🧨🧨🧨  
# Lúc tải về cần:
- Tải file **\_vimrc** cho vào **F:\Vim**  

- Tạo một folder tên **'plugged'** trong thư mục **Vim*  
- Sau đó chạy mở **gvim**/**vim** lên và gõ **:e $MYVIMRC** rồi **enter**  
- Lưu nó lại với lệnh **:w**
- Sau đó là gõ **so%** để load lại **_vimrc**  
- Sau đó gõ **PlugInstall** để cài tất cả plugin có trong **_vimrc**  
- Đối với theme dracula thì phải làm như sau chứ nó không có tự động như mấy cái đuồi bầu kia  
   - Trong **F:/Vim/plugged/dracula/autoload** copy file **dracula.vim** bỏ vào **F:/Vim/vim82/autoload**  
   - Trong **F:/Vim/plugged/dracula/colors** copy file **dracula.vim** bỏ vào **F:/Vim/vim82/colors**  

# Đến phần cài đặt để code latex:
- Cài đặt một công cụ viết latex trên window 10 dì đó đi: thường thì thấy mng cài **TexLive** được nhưng mà mình cài không được nền mình chuyển sang dùng **MikTex**  
- Sau khi cài **MikTex** mình cài **Perl**, sau đó add Perl vô **runtime path** của win 10  (**Nếu cài TexLive rồi thì không cần cài Perl nữa nha, bỏ qua 2 bước cuối**)  

- Sau đó mở **MikTex** lên để cài package **Latexmk** 

# Code autocomplete hay code suggestion dì đó :vv

- Để có được code completion thì phải cài **Nodejs** rồi cũng add vô **runtime path**  

- Code completion tùy vào ngôn ngữ bạn code. Ví dụ như mình code python thì mình cài coc-pyright, chỉ cần gõ **:CocInstall coc-pyright**
- Kiếm ngôn ngữ bạn muốn code sau đó làm như trên là oke    

Sau đó là tận hưởng thành quả 😊

Có thắc mắc dì thì cứ mở issues nhé! Đang tập dùng github nha nên thông cảm nếu file markdown này không được bắt mắt  
