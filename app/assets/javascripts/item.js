$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<input class="js-file" type="file" name="item[images_attributes][${index}][img]" id="item_images_attributes_${index}_img">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

// $(function(){

//   $('.file_field1').on('change', function(e){
//     var file = e.target.files[0];
//     var reader = new FileReader();
//     reader.onload = (function(e){
//       var ar = new Uint8Array(reader.result);  
//       $(".img_box1").append($("<img class = photo_img>").attr("src", e.target.result));
//   })
//   reader.readAsDataURL(file);
// })

//   $('.file_field2').on('change', function(e){
//     var file = e.target.files[0];
//     var reader = new FileReader();
//     reader.onload = (function(e){
//       var ar = new Uint8Array(reader.result);  
//       $(".img_box2").append($("<img class = photo_img>").attr("src", e.target.result));
//   })
//   reader.readAsDataURL(file);
//   })

//   $('.file_field3').on('change', function(e){
//     var file = e.target.files[0];
//     var reader = new FileReader();
//     reader.onload = (function(e){
//       var ar = new Uint8Array(reader.result);  
//       $(".img_box3").append($("<img class = photo_img>").attr("src", e.target.result));
//   })
//   reader.readAsDataURL(file);
//   })

//   $('.file_field4').on('change', function(e){
//     var file = e.target.files[0];
//     var reader = new FileReader();
//     reader.onload = (function(e){
//       var ar = new Uint8Array(reader.result);  
//       $(".img_box4").append($("<img class = photo_img>").attr("src", e.target.result));
//   })
//   reader.readAsDataURL(file);
//   })

//   $('.file_field5').on('change', function(e){
//     var file = e.target.files[0];
//     var reader = new FileReader();
//     reader.onload = (function(e){
//       var ar = new Uint8Array(reader.result);  
//       $(".img_box5").append($("<img class = photo_img>").attr("src", e.target.result));
//   })
//   reader.readAsDataURL(file);
//   })

//   $('.remove_btn1').on('click', function(){
//     $('#image').val('');
//     $('.img_box1').html('');
//   })

//   $('.remove_btn2').on('click', function(){
//     $('#image2').val('');
//     $('.img_box2').html('');
//   })

//   $('.remove_btn3').on('click', function(){
//     $('#image3').val('');
//     $('.img_box3').html('');
//   })

//   $('.remove_btn4').on('click', function(){
//     $('#image4').val('');
//     $('.img_box4').html('');
//   })

//   $('.remove_btn5').on('click', function(){
//     $('#image5').val('');
//     $('.img_box5').html('');
//   })

// })

$(function(){
  $('#price_calc').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#price_calc').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.listing_right_bar').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.listing_right_bar').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.listing_right_bar_2').html(profit)
    $('.listing_right_bar_2').prepend('¥')
    $('#price').val(data) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
      if(profit == '') {   // もし､計算結果が''なら表示も消す｡
        $('.listing_right_bar_2').html('');
        $('.listing_right_bar').html('');
      }
    })
  })