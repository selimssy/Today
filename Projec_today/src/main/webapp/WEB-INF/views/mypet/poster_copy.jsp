<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#poster_container{display:none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; z-index:8;}
#poster_wrapper{width: 1250px; /*height: 1000px;*/ height: 725px; background: #fff; border: 3px solid #bbb; padding: 30px; border-radius: 15px;  box-sizing: border-box;  position: relative;}
.poster{display: flex; justify-content: space-evenly; box-sizing: border-box;}
.buttonBox{height: 33px; padding-bottom: 20px;}
.posterClose{width: 27px; height: 27px; border: none; border-radius: 5px; background: #ddd; position:absolute; top:15px; right: 15px; cursor: pointer;}
.template{width: 70px; height: 33px; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder;  cursor: pointer;}
.template:nth-of-type(1){position:absolute; left: 45px;}
.template:nth-of-type(2){position:absolute; left: 130px;}
.template:nth-of-type(3){position:absolute; left: 215px;}
.posterDownload{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; right: 320px; cursor: pointer;}
.frame{width: 900px; height: 600px; background: url(/today/img/mypet/p1.jpg); position: relative;}
.photo{cursor: pointer; background-size: cover; background-repeat: no-repeat; box-shadow: 12px 12px 20px rgba(0,0,0,0.5);}
.photo:nth-of-type(1){background-image: url(/today/img/mypet/photoselect.PNG); width: 373px; height: 350px; transform: rotate(2deg); position: absolute; top:68px; left:245px; z-index: 9;}
.photo:nth-of-type(2){background-image: url(/today/img/mypet/photoselect.PNG); width: 213px; height: 207px; transform: rotate(358deg); position: absolute; top:42px; left:53px;}
.photo:nth-of-type(3){background-image: url(/today/img/mypet/photoselect.PNG); width: 227px; height: 220px; transform: rotate(359deg); position: absolute; top:36px; left:649px;}
.photo:nth-of-type(4){background-image: url(/today/img/mypet/photoselect.PNG); width: 230px; height: 207px; transform: rotate(358deg); position: absolute; top:348px; left:40px;}
.photo:nth-of-type(5){background-image: url(/today/img/mypet/photoselect.PNG); width: 243px; height: 236px; transform: rotate(358deg); position: absolute; top:329px; left:574px; z-index: 10;}

.tape{z-index: 20;}
.photo:nth-of-type(1) .tape{width: 113px; height: 107px;position: absolute; top:-60px; left:153px; transform: rotate(3deg);}
.photo:nth-of-type(2) .tape{width: 60px; height: 60px;position: absolute; top:-33px; left:85px; transform: rotate(350deg);}
.photo:nth-of-type(3) .tape{width: 60px; height: 60px;position: absolute; top:-32px; left:93px; transform: rotate(350deg); }
.photo:nth-of-type(4) .tape{width: 60px; height: 60px;position: absolute; top:-31px; left:93px; transform: rotate(352deg);}
.photo:nth-of-type(5) .tape{width: 77px; height: 70px;position: absolute; top:-34px; left:98px; transform: rotate(357deg);}

.photo img{object-fit: cover;}
.photo:nth-of-type(1) .inPhoto{width: 347px; height: 265px; position: absolute; top: 13px; left: 14px; display:none}
.photo:nth-of-type(2) .inPhoto{width: 198px; height: 158px; position: absolute; top: 8px; left: 6px; display:none}
.photo:nth-of-type(3) .inPhoto{width: 211px; height: 168px; position: absolute; top: 8px; left: 7px; display:none}
.photo:nth-of-type(4) .inPhoto{width: 215px; height: 158px; position: absolute; top: 9px; left: 6px; display:none}
.photo:nth-of-type(5) .inPhoto{width: 228px; height: 180px; position: absolute; top: 8px; left: 7px; display:none}

.photo p{position: absolute; text-align: center; font-weight: bold; font-family: 'Nanum Pen Script'; margin: 0;}
.photo:nth-of-type(1) p{bottom: 15px; left: 10px; width: 353px; font-size: 35px;}
.photo:nth-of-type(2) p{bottom: 9px; left: 7px; width: 198px; font-size: 20px;}
.photo:nth-of-type(3) p{bottom: 10px; left: 7px; width: 211px; font-size: 21px;}
.photo:nth-of-type(4) p{bottom: 7px; left: 7px; width: 215px; font-size: 21.5px;}
.photo:nth-of-type(5) p{bottom: 10px; left: 7px; width: 228px; font-size: 23px;}


.gallerySelect{width: 270px; height: 600px; margin-left: 15px;box-shadow: 0 0 20px 0 #e8e8e8; padding: 25px 0 25px 25px; box-sizing: border-box; overflow-y: scroll;}
.gallerySelect p{text-align: center; font-family: 'Nanum Pen Script'; font-size: 25px; padding-bottom: 20px}
.SelectInner{display:none;}
.SelectInner img{width: 100px; height: 75px; margin-right: 10px; margin-bottom: 15px; float: left; border-radius: 5px; object-fit:cover; cursor: pointer;}
.SelectInner img:nth-of-type(2n){margin-right: 0;}

</style>


    <div id="poster_container">
    <div id="poster_wrapper" >
		<button type="button" class="posterClose">X</button>
        <div class="buttonBox">
            <button class="template" type="button">템플릿1</button>
            <button class="template" type="button">템플릿2</button>
            <button class="template" type="button">템플릿3</button>
            <button class="posterDownload" type="button">다운로드</button>
        </div>


        <div class="poster">
            <div class="frame">
                <div class="photo" id="1_1">
                    <img class="tape" src="/today/img/mypet/tape.png">
                    <img class="inPhoto" src="" style="object-fit: cover;">
                    <p></p>
                </div>

                <div class="photo" id="1_2">
                    <img class="tape" src="/today/img/mypet/tape.png">
                    <img class="inPhoto" src="" style="object-fit: cover;">
                    <p></p>
                </div>

                <div class="photo" id="1_3">
                    <img class="tape" src="/today/img/mypet/tape.png">
                    <img class="inPhoto" src="" style="object-fit: cover;">
                    <p></p>
                </div>

                <div class="photo" id="1_4">
                    <img class="tape" src="/today/img/mypet/tape.png">
                    <img class="inPhoto" src="" style="object-fit: cover;">
                    <p></p>
                </div>

                <div class="photo" id="1_5">
                    <img class="tape" src="/today/img/mypet/tape.png">
                    <img class="inPhoto" src="" style="object-fit: cover;">
                    <p></p>
                </div>
            </div>

            <div class="gallerySelect">
            	<p>사진을 선택해주세요.</p>
                <div class="SelectInner">
                    
                    
           
                </div>
            </div>
        </div>
        
        
        
    </div>
	</div>
    


	<script type="text/javascript">
		//포스터 섹션 위치
		let postePhotoNum = "0_0";
	
		// 사진영역 클릭
	    $(document).on("click", ".photo", function () {
	    	postePhotoNum = $(this).attr("id");
	        $(".SelectInner").css("display","block");
	        $('.SelectInner').empty();
	        
	        const petId = "${login.pet.petId}";
    		console.log(petId);
    		const pet = {
    				petId: petId
                    };
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/mypet/posterGallery',
                data: JSON.stringify(pet),
                success: function (response) {
                	console.log(response); // GalleryVO 
                    for(let i = 0; i < response.length; i++){
                    	let src = "/today" + response[i]['imagePath'];
                  	    let title = response[i]['title'];

                        let temp_html = "<img class='posterPhotoList' alt='" + title + "' src='" + src + "'>"; 

                        $('.SelectInner').append(temp_html);
                    }
                }, 
                error: function() {
                    console.log("통신 실패!");
                } 
            });
	    })
	    
	    
	    
	    // 사진 선택 이벤트
	    $(document).on("click", ".posterPhotoList", function () {
	    	
	    	src = $(this).attr("src");
	    	title = $(this).attr("alt");

	        $("#" + postePhotoNum + " .inPhoto").css("display","block").attr("src",src);
	        $("#" + postePhotoNum + " p").text(title);        
	       
	    })
	    
	    
	    
	    
	 	// 포스터 이미지로 저장
        $(".posterDownload").on("click",function(){   
        	
            html2canvas($('.frame')[0]).then(function(canvas){   
                let img = document.createElement("a");    
                img.download = "todayPoster.png";   
                img.href=canvas.toDataURL();  
                document.body.appendChild(img);   
                img.click();   
                
                URL.revokeObjectURL(objectURL); //메모리 해제
            });    
        });  
	    
	
	</script>



