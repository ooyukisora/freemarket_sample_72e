
// いいねつける処理
$("#favoriteBtn").html("<%= j(render partial: 'favorite', locals: { items: @item, favorites: @favorites, favorite: @favorite}) %>")

// いいね消す処理
$("#favoriteBtn").html("<%= j(render partial: 'favorite', locals: { items: @item, favorites: @favorites }) %>");