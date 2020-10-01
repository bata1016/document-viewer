if (document.URL.match( /new/ ) || document.URL.match(/edit/)) {
  document.addEventListener('DOMContentLoaded', function() {
    const reader = new FileReader()
    const ImageList = document.getElementById('preview-list')
    document.getElementById('new_pdf').addEventListener('change', function(e) {


      // const file = e.target.files[0];

      const fileList = e.target.files;
      if (fileList) {
        const fileCount = fileList.length;
        if (fileCount > 5) {
          return false;
        }
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContents = document.querySelectorAll('img');
      if (imageContents) {
        imageContents.forEach( function(imageContent) {
        imageContent.remove();
        })
      }

      const previewContents = document.getElementsByClassName('previews');
      if (previewContents){
      const preview = Array.prototype.slice.call(previewContents)
        preview.forEach( function(previewContent) {
          previewContent.remove();
        })
      }
      for (let i = 0; i < fileCount; i++ ) {
        file = e.target.files[i]
        const blob = window.URL.createObjectURL(file);

      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // divにクラスを追加
      imageElement.classList.add("previews")

      // divのcssを指定
      // imageElement.setAttribute();
      // imageElement.setAttribute();

      // imageElement.setAttribute('height','90%');


      


      // 表示する画像を生成
      const blobImage = document.createElement('iframe');
      blobImage.setAttribute('src', blob);
      // blobImage.setAttribute('width', "100%");
      // blobImage.setAttribute('height', "100%");





      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
      }

      // const blob = window.URL.createObjectURL(files);

      }
      
    })
  })
}
