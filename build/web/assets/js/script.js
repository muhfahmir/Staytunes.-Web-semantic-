let bool = false;
//let aButton = document.querySelector('.hero__info a[href="#search-app"]');
//let secSearch = document.querySelector("#search-app");
//const heroInfoButton = document.querySelector("#heroInfoButton");
//heroInfoButton.addEventListener("click", function () {
//  searchApp();
//});
//
//function searchApp() {
//  bool = !bool;
//  if (bool) {
////    secSearch.style.display = "block";
////    secSearch.classList.add("w3-animate-left");
////    secSearch.classList.remove("w3-animate-right");
//    aButton.setAttribute("href", "#search-app");
////    aButton.setAttribute("href", "#banner-app");
//  } else {
////    secSearch.style.display = "none";
////    secSearch.classList.remove("w3-animate-left");
////    secSearch.classList.add("w3-animate-right");
//    aButton.setAttribute("href", "#banner-app");
////    aButton.setAttribute("href", "#search-app");
//  }
//}

let searchApk = document.querySelector("#search-app");
$(document).ready(() => {
  $(".page-scroll").on("click", function (e) {
    // console.log("oke");
    e.preventDefault();
    $(document).off("scroll");
    var athis = this;
    var target = this.hash;
    //    menu = target;
    $target = $(target);
    $("html,body")
      .stop()
      .animate(
        {
          scrollTop: $target.offset().top - 79
        },
        800
      );
  });
});

