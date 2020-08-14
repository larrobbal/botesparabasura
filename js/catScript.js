/*!
    * Start Bootstrap - Agency v6.0.2 (https://startbootstrap.com/template-overviews/agency)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
    */
   (function ($) {
    "use strict"; // Start of use strict

    // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
        if (
            location.pathname.replace(/^\//, "") ==
                this.pathname.replace(/^\//, "") &&
            location.hostname == this.hostname
        ) {
            var target = $(this.hash);
            target = target.length
                ? target
                : $("[name=" + this.hash.slice(1) + "]");
            if (target.length) {
                $("html, body").animate(
                    {
                        scrollTop: target.offset().top - 72,
                    },
                    1000,
                    "easeInOutExpo"
                );
                return false;
            }
        }
    });

    // Closes responsive menu when a scroll trigger link is clicked
    $(".js-scroll-trigger").click(function () {
        $(".navbar-collapse").collapse("hide");
    });

    // Activate scrollspy to add active class to navbar items on scroll
    $("body").scrollspy({
        target: "#catalogNav",
        offset: 74,
    });

    // Collapse Navbar
    var navbarCollapse = function () {
        if ($("#catalogNav").offset().top > 100) {
            $("#catalogNav").addClass("navbar-shrink");
        } else {
            $("#catalogNav").removeClass("navbar-shrink");
        }
    };
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);
    
    //Sidebar overlay
    $(document).ready(function () {
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#dismiss, .overlay').on('click', function () {
            // hide sidebar
            $('#sidebar').removeClass('active');
            // hide overlay
            $('.overlay').removeClass('active');
            /*//show navbar
            $('#catalogNav').removeClass('zindex-dropdown');*/
        });

        $('#sidebarCollapse').on('click', function () {
            // open sidebar
            $('#sidebar').addClass('active');
            /*//hide navbar
            $('#catalogNav').addClass('zindex-dropdown');*/
            // fade in the overlay
            $('.overlay').addClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });
    $(document).ready(function () {
        var xhr = new XMLHttpRequest();
        var catalogContent = $('div#catalog-content');
        var catalog = document.getElementById('catalog-content');
        var sidebar = document.getElementById('sidebar-options');
        var myObj;
        var data={};
        var txt="";
        data['cat']=true;
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
                catalogContent.empty();
                myObj.forEach(element => 
                {
                    var divElement = document.createElement('div');
                    divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
                    divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a class="catalog-category" id="'+element.idCategoria+'" href="#" onclick="catalog(event,this,\''+element.nombreCategoria+'\');"><img class="img-fluid h-100 rounded catalog-item" src="assets/img/catalog/category/'+element.imagenCategoria+'.jpg" alt="'+element.nombreCategoria+'"></a><div class="caption"><span>'+element.nombreCategoria+'</span> </div></div>';
                    catalog.appendChild(divElement);
                });
                myObj.forEach(element => 
                {
                    var listCategorySidebar = document.createElement('li');
                    listCategorySidebar.setAttribute('class','d-inline');
                    var aCategory = document.createElement('a');
                    var viewCategory = document.createElement('a');
                    var listSubcategorySidebar = document.createElement('ul');
                    aCategory.setAttribute('data-toggle','collapse');
                    aCategory.setAttribute('aria-expanded','false');
                    aCategory.setAttribute('href','#cat'+element.idCategoria);
                    viewCategory.setAttribute('class','catalog-category');
                    viewCategory.setAttribute('id',element.idCategoria);
                    viewCategory.setAttribute('href','#');
                    viewCategory.setAttribute('onclick','catalog(event,this,\''+element.nombreCategoria+'\');');
                    viewCategory.innerHTML='<i class="fas fa-eye"></i>';
                    aCategory.innerHTML=element.nombreCategoria;
                    listCategorySidebar.appendChild(viewCategory);
                    listSubcategorySidebar.setAttribute('class','collapse list-unstyled');
                    listSubcategorySidebar.setAttribute('id','cat'+element.idCategoria);
                    $.ajax({
                        data: {"categoria" : element.idCategoria},
                        type: "POST",
                        dataType: "json",
                        url: "assets/php/productos.php",
                    })
                     .done(function( data, textStatus, jqXHR ) {
                        data.forEach(element => 
                        {
                            var subcategory = document.createElement('li');
                            subcategory.innerHTML='<a class="catalog-subcategory" id="'+element.idSubcategoria+'" href="#" onclick="catalog(event,this,\''+element.nombreSubcategoria+'\');">'+element.nombreSubcategoria+'</a>';
                            listSubcategorySidebar.appendChild(subcategory);
                        });
                     })
                     .fail(function( jqXHR, textStatus, errorThrown ) {
                         if ( console && console.log ) {
                             console.log( "La solicitud a fallado: " +  textStatus);
                         }
                    });
                    listCategorySidebar.appendChild(aCategory);
                    listCategorySidebar.appendChild(listSubcategorySidebar);
                    sidebar.appendChild(listCategorySidebar);
                });
            }
        }
    });
})(jQuery); // End of use strict
function catalog(e,item,name)
{
    
    if(item.getAttribute('class')=="catalog-category")
    {
        e.preventDefault();
        loadSubcategory(item.getAttribute('id'),name);
    }
    else if(item.getAttribute('class')=="catalog-subcategory")
    {
        e.preventDefault();
        loadProducts(item.getAttribute('id'),name);
    }
    else if(item.getAttribute('class')=="catalog-product")
    {
        showModal(item.getAttribute('id'),name);
    }
}
function loadSubcategory(category,name)
{
    var catalogContent = $('div#catalog-content');
    var catalog = document.getElementById('catalog-content');
    $('.catalog-category-title').text(name);
    $('.catalog-subcategory-title').text('Selecciona la subcategoría que desas visitar');
    $.ajax({
        data: {"categoria" : category},
        type: "POST",
        dataType: "json",
        url: "assets/php/productos.php",
    })
     .done(function( data, textStatus, jqXHR ) {
        catalogContent.empty();
        data.forEach(element => 
        {
            var divElement = document.createElement('div');
            divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
            divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a class="catalog-subcategory" id="'+element.idSubcategoria+'" href="#" onclick="catalog(event,this,\''+element.nombreSubcategoria+'\');"><img class="img-fluid h-100 rounded catalog-item" src="assets/img/catalog/subcategory/'+element.imagenSubcategoria+'.jpg" alt="'+element.nombreSubcategoria+'"></a><div class="caption"><span>'+element.nombreSubcategoria+'</span> </div></div>';
            catalog.appendChild(divElement);
        });
     })
     .fail(function( jqXHR, textStatus, errorThrown ) {
         if ( console && console.log ) {
             console.log( "La solicitud a fallado: " +  textStatus);
         }
    });
}

function loadProducts(subcategory,name)
{
    var catalogContent = $('div#catalog-content');
    var catalog = document.getElementById('catalog-content');
    $('.catalog-category-title').text(name);
    $('.catalog-subcategory-title').text('Selecciona un producto para conocerlo a detalle');
    $.ajax({
        data: {"subcategoria" : subcategory},
        type: "POST",
        dataType: "json",
        url: "assets/php/productos.php",
    })
     .done(function( data, textStatus, jqXHR ) {
        catalogContent.empty();
        data.forEach(element => 
        {
            var divElement = document.createElement('div');
            divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
            divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a class="catalog-product" id="'+element.idProducto+'" href="#" onclick="catalog(event,this,\''+element.nombreProducto+'\');" data-toggle="modal" data-target="#modal-product"><img class="img-fluid h-100 rounded catalog-item" src="assets/img/catalog/product/'+element.imagenProducto+'.jpg" alt="'+element.nombreProducto+'"></a><div class="caption"><span>'+element.nombreProducto+'</span> </div></div>';
            catalog.appendChild(divElement);
        });
     })
     .fail(function( jqXHR, textStatus, errorThrown ) {
         if ( console && console.log ) {
             console.log( "La solicitud a fallado: " +  textStatus);
         }
    });
}
function showModal(idproducto,name)
{
    var heading = ['Descripcion:','Linea:','Acabado:','Material:','Calibre:','Capacidad:','Colores:','Anclaje:','Vaciado:','Largo Total:','Ancho Total:','Alto Total:','Diametro Principal:','Largo (Contenedor):','Ancho (Contenedor):','Alto (Contenedor):','Diametro (Contenedor):','Largo (Letrero):','Alto (Letrero):','Adicional:'];
    var modalTitle = document.getElementById('modal-product-title');
    modalTitle.innerHTML=name;
    var modalBody = $('#row-modal');
    var aux="";
    var cont=0;
    $.ajax({
        data: {"idProducto" : idproducto},
        type: "POST",
        dataType: "json",
        url: "assets/php/productos.php",
    })
     .done(function( data, textStatus, jqXHR ) {
        if(data==null)
            modalBody.empty();
        data.forEach(element => 
        {
            modalBody.empty();
            var tablaModal = document.createElement('table');
            tablaModal.setAttribute('class','table-modal-product')
            var tablaBody = document.createElement('tbody');
            tablaBody.setAttribute('class','align-baseline');
            var divImg = document.createElement('div');
            var divInfo = document.createElement('div');
            divImg.setAttribute('class','col-md-5')
            divImg.setAttribute('id','image-modal-product');
            divInfo.setAttribute('class','col-md-7');
            divInfo.setAttribute('id','info-modal-product');
            divImg.innerHTML='<img class="img-fluid w-100 rounded" src="assets/img/catalog/product/'+element.imagen+'.jpg" alt="'+name+'">';
            for(var i in element)
            {
                if(i!='imagen')
                {
                    aux=aux+'<tr><td>'+heading[cont]+'</td><td>'+element[i]+'</td></tr><tr><td>';
                    cont+=1;
                }
            }
            tablaBody.innerHTML=aux;
            tablaModal.appendChild(tablaBody);
            divInfo.appendChild(tablaModal);
            var rowModal = document.getElementById('row-modal');
            rowModal.appendChild(divImg);
            rowModal.appendChild(divInfo);

        });
     })
     .fail(function( jqXHR, textStatus, errorThrown ) {
         if ( console && console.log ) {
             console.log( "La solicitud a fallado: " +  textStatus);
         }
    });
}
function homeCatalog() 
{
    var xhr = new XMLHttpRequest();
    var catalogContent = $('div#catalog-content');
    var catalog = document.getElementById('catalog-content');
    $('.catalog-category-title').text('Nuestros Productos');
    $('.catalog-subcategory-title').text('Selecciona la categoría que deseas visitar');
    var myObj;
    var data={};
    var txt="";
    data['cat']=true;
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
            catalogContent.empty();
            myObj.forEach(element => 
            {
                var divElement = document.createElement('div');
                divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
                divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a class="catalog-category" id="'+element.idCategoria+'" href="#" onclick="catalog(event,this,\''+element.nombreCategoria+'\');"><img class="img-fluid h-100 rounded catalog-item" src="assets/img/catalog/category/'+element.imagenCategoria+'.jpg" alt="'+element.nombreCategoria+'"></a><div class="caption"><span>'+element.nombreCategoria+'</span> </div></div>';
                catalog.appendChild(divElement);
            });
        }
    }
}