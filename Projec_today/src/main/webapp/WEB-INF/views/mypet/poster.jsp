<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
#wrapper{width: 1450px; /*height: 1000px;*/ height: 750px; background: #fff; border: 3px solid #bbb; padding: 40px; border-radius: 15px;  box-sizing: border-box;  position: relative;}
.poster{display: flex; justify-content: space-evenly; box-sizing: border-box;}
.buttonBox{height: 33px; padding-bottom: 20px;}
.template{width: 70px; height: 33px; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder;  cursor: pointer;}
.template:nth-of-type(1){position:absolute; left: 45px;}
.template:nth-of-type(2){position:absolute; left: 130px;}
.template:nth-of-type(3){position:absolute; left: 215px;}
.posterDownload{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; right: 50px; cursor: pointer;}
.frame{width: 900px; height: 600px; background-image: url(/today/img/mypet/p1.jpg); position: relative;}
.photo img{cursor: pointer;}
.photo:nth-of-type(1) img{width: 440px; height: 450px; transform: rotate(2deg); position: absolute; top:5px; left:225px;z-index: 9;}
.photo:nth-of-type(2) img{width: 280px; height: 280px; transform: rotate(358deg); position: absolute; top:10px; left:30px;}
.photo:nth-of-type(3) img{width: 295px; height: 300px; transform: rotate(359deg); position: absolute; top:2px; right:-20px;}
.photo:nth-of-type(4) img{width: 295px; height: 290px; transform: rotate(358deg); position: absolute; bottom:-2px; left:17px;}
.photo:nth-of-type(5) img{width: 315px; height: 320px; transform: rotate(358deg); position: absolute; top:293px; left:550px; z-index: 10;}


.gallerySelect{width: 420px; height: 600px; margin-left: 30px;box-shadow: 0 0 20px 0 #e8e8e8; padding: 25px 0 25px 25px; box-sizing: border-box; overflow-y: scroll;}
.SelectInner{/*width: 100%; padding: 0 25px;margin: 0 auto; overflow-y: scroll;*/}
.SelectInner img{width: 103px; height: 76px; margin-right: 16px; margin-bottom: 15px; float: left; border-radius: 5px; object-fit:cover;}
.SelectInner img:nth-of-type(3n){margin-right: 0;}

#ex{position:absolute; top:0; left: 0; opacity: 0.4;}
</style>

    <div id="wrapper" >

        <div class="buttonBox">
            <button class="template" type="button">템플릿1</button>
            <button class="template" type="button">템플릿2</button>
            <button class="template" type="button">템플릿3</button>
            <button class="posterDownload" type="button">다운로드</button>
        </div>


        <div class="poster">
            <div class="frame">
                <div class="photo">
                    <img src="/today/img/mypet/photo1.png">
                
                </div>

                <div class="photo">
                    <img src="/today/img/mypet/photo2.png">
                    
                </div>

                <div class="photo">
                    <img src="/today/img/mypet/photo2.png">
                    
                </div>

                <div class="photo">
                    <img src="/today/img/mypet/photo2.png">
                
                </div>

                <div class="photo">
                    <img src="/today/img/mypet/photo2.png">
                    
                </div>
            </div>

            <div class="gallerySelect">
                <div class="SelectInner">
                    <img src="/today/img/mypet/p1.jpg">
                    <img src="/today/img/mypet/p1.jpg">
                    <img src="/today/img/mypet/p1.jpg">
                    <img src="/today/img/mypet/p1.jpg">
                </div>
            </div>
        </div>
        
        
        <div>
            <!--
            <img id="ex" src="./images/ex1.png" width="920px" height="612px">
                -->
        </div>
    </div>