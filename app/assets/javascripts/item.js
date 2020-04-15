

$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-box">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][img]"
                    id="item_images_attributes_${index}_img"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  
  lastIndex = $('.js-box:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('img', blobUrl);
    } else {  
      $('#previews').append(buildImg(targetIndex, blobUrl));
      if ($('.js-file').length < 4) $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    $(`img[data-index="${targetIndex}"]`).remove();
    $('#image-box').append(buildFileField(fileIndex[targetIndex]));

  });
});


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