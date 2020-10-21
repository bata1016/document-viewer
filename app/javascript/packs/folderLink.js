window.addEventListener("load", function(){
    const pathName = location.pathname;
    console.log(pathName);
    console.log($('a[href="'+pathName+'"]').css({"background-Color":"red"}));
  // const pathName = location.pathname
  // console.log(pathName)
  // const aTag = document.createElement("a");

  // aTag.setAttribute("style", "background-Color:red;")
  // console.log($('a[href="'+pathName+'"]').css({"background-Color":"red"});
});

