(function($)
{
    'use strict';
    $('#navbarResponsive ul li a.cat').click(
        function()
        {
            var category = $(this).attr('id');
            if(category!='contact')
            {
                
                var miniCatalogContent = $('div#mini-catalog-content');
                var catalog = document.getElementById('mini-catalog-content');
                var xhr = new XMLHttpRequest();
                var txt = "";
                var myObj;
                var data = {};
                var id=category.slice(3,8);
                $('div#mini-catalog-category h3').text($(this).text());
                data['categoria']=id;
                var json_string = JSON.stringify(data);
                xhr.open('POST',"assets/php/productos.php",true);
                xhr.setRequestHeader("Content-type", "application/json");
                xhr.send(json_string);

                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        txt += this.responseText;
                        myObj = JSON.parse(this.responseText);
                        miniCatalogContent.empty();
                        myObj.forEach(element => 
                        {
                            var divElement = document.createElement('div');
                            divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
                            divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a class="mini-catalog-item" id="'+element.idSubcategoria+'" href="#" onclick="catalog(event,this);"><img class="img-fluid h-100 rounded catalog-item" src="assets/img/catalog/subcategory/'+element.imagenSubcategoria+'.jpg" alt="'+element.nombreSubcategoria+'"></a><div class="caption"><span>'+element.nombreSubcategoria+'</span> </div></div>';
                            catalog.appendChild(divElement);
                            
                        });
                    }
                }
            }
        }
    )
    $('#front-cat-list li a.cat').click(
        function()
        {
            var category = $(this).attr('id');
            if(category!='contact')
            {
                var miniCatalogContent = $('div#mini-catalog-content');
                var catalog = document.getElementById('mini-catalog-content');
                var xhr = new XMLHttpRequest();
                var txt = "";
                var myObj;
                var data = {};
                var id=category.slice(3,8);
                $('div#mini-catalog-category h3').text($(this).text());
                data['categoria']=id;
                var json_string = JSON.stringify(data);
                xhr.open('POST',"assets/php/productos.php",true);
                xhr.setRequestHeader("Content-type", "application/json");
                xhr.send(json_string);

                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        txt += this.responseText;
                        myObj = JSON.parse(this.responseText);
                        miniCatalogContent.empty();
                        myObj.forEach(element => 
                        {
                            var divElement = document.createElement('div');
                            divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
                            divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a class="mini-catalog-item" id="'+element.idSubcategoria+'" href="#" onclick="catalog(event,this);"><img class="img-fluid h-100 rounded" src="assets/img/catalog/subcategory/'+element.imagenSubcategoria+'.jpg" alt="'+element.nombreSubcategoria+'"></a><div class="caption"><span>'+element.nombreSubcategoria+'</span> </div></div>';
                            catalog.appendChild(divElement);
                        });
                    }
                }
            }
        }
    )
    
})(jQuery);
function catalog(e,a)
    {
        e.preventDefault();
        var subcategory = a.getAttribute('id');
        $.post('assets/php/redirect.php', {idSubcategoria : subcategory}, function(response){
            window.location.href = response;
            return false;
        });
    }