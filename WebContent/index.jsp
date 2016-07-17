<%@page import="bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
	
	<div id="body">
		<div class="header">
			<div>
				     <script>
        jQuery(document).ready(function ($) {

            var _CaptionTransitions = [];
            _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["ZMF|10"] = { $Duration: 900, $Zoom: 11, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 };
            _CaptionTransitions["RTT|10"] = { $Duration: 900, $Zoom: 11, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8} };
            _CaptionTransitions["RTT|2"] = { $Duration: 900, $Zoom: 3, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 0.5} };
            _CaptionTransitions["RTTL|BR"] = { $Duration: 900, x: -0.6, y: -0.6, $Zoom: 11, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.8} };
            _CaptionTransitions["CLIP|LR"] = { $Duration: 900, $Clip: 15, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
            _CaptionTransitions["MCLIP|L"] = { $Duration: 900, $Clip: 1, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic} };
            _CaptionTransitions["MCLIP|R"] = { $Duration: 900, $Clip: 2, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic} };

            var options = {
                $FillMode: 2,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                               //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $CaptionSliderOptions: {                            //[Optional] Options which specifies how to animate caption
                    $Class: $JssorCaptionSlider$,                   //[Required] Class to create instance to animate caption
                    $CaptionTransitions: _CaptionTransitions,       //[Required] An array of caption transitions to play caption, see caption transition section at jssor slideshow transition builder
                    $PlayInMode: 1,                                 //[Optional] 0 None (no play), 1 Chain (goes after main slide), 3 Chain Flatten (goes after main slide and flatten all caption animations), default value is 1
                    $PlayOutMode: 3                                 //[Optional] 0 None (no play), 1 Chain (goes before main slide), 3 Chain Flatten (goes before main slide and flatten all caption animations), default value is 1
                },

                $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 8,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 8,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                },

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 1920));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
    <!-- Jssor Slider Begin -->
    <!-- To move inline styles to css file/block, please specify a class name for each element. --> 
    <div id="slider1_container" style="position: relative; margin: 0 auto;
        top: 0px; left: -215px; width: 1300px; height: 500px; overflow: hidden;">
        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;
                top: 0px; left: -210px; width: 80%; height: 100%;">
            </div>
            <div style="position: absolute; display: block; background: url(<%=request.getContextPath() %>/templates/public/images/loading.gif) no-repeat center center;
                top: 0px; left: 0px; width: 80%; height: 100%;">
            </div>
        </div>
        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1300px;
            height: 500px; overflow: hidden;">
            <div>
                <img u="image" src="<%=request.getContextPath() %>/templates/public/images/1920/red.jpg" />
                <div u="caption" t="NO" t3="RTT|2" r3="137.5%" du3="3000" d3="500" style="position: absolute; width: 445px; height: 300px; top: 100px; left: 600px;">
                    <img src="<%=request.getContextPath() %>/templates/public/images/new-site/anh1.jpg" style="position: absolute; width: 445px; height: 300px; top: 0px; left: 0px;" />
                   
                </div>
                <div u="caption" t="RTT|2" r="-75%" du="1600" d="2500" t2="NO" style="position: absolute; width: 470px; height: 220px; top: 120px; left: 650px;">
                    <img src="<%=request.getContextPath() %>/templates/public/images/new-site/c-phone-horizontal.png" style="position: absolute; width: 470px; height: 220px; top: 0px; left: 0px;" />
                    <img u="caption" t3="MCLIP|L" du3="2000" src="<%=request.getContextPath() %>/templates/public/images/new-site/anh4.jpg" style="position: absolute; width: 379px; height: 213px; top: 4px; left: 45px;" />
                    <img u="caption" t="MCLIP|R" du="2000" t2="NO" src="<%=request.getContextPath() %>/templates/public/images/new-site/c-slide-3.jpg" style="position: absolute; width: 379px; height: 213px; top: 4px; left: 45px;" />
                   
                    <img src="<%=request.getContextPath() %>/templates/public/images/ut.jpg" style="position: absolute; width: 379px; height: 213px; top: 4px; left: 45px;" />
                </div>
                <div style="position: absolute; width: 480px; height: 120px; top: 30px; left: 30px; padding: 5px;
                    text-align: left; line-height: 60px; text-transform: uppercase; font-size: 50px;
                        color: #FFFFFF;">HOÀNG TUẤN NHÂN
                </div>
                <div style="position: absolute; width: 480px; height: 120px; top: 300px; left: 30px; padding: 5px;
                    text-align: left; line-height: 36px; font-size: 30px;
                        color: #FFFFFF;">
                       Trường Đại học Bách Khoa - Đại học Đà Nẵng <br />
					   Lớp 12T4<br />
					   MSSV:102120239
                </div>
            </div>
             <div>
                <img u="image" src="<%=request.getContextPath() %>/templates/public/images/1920/blue.jpg" />
                <div u="caption" t="NO" t3="RTT|2" r3="137.5%" du3="3000" d3="500" style="position: absolute; width: 445px; height: 300px; top: 100px; left: 600px;">
                    <img src="<%=request.getContextPath() %>/templates/public/images/a3.jpg" style="position: absolute; width: 445px; height: 300px; top: 0px; left: 0px;" />
                    
                </div>
                <div u="caption" t="RTT|2" r="-75%" du="1600" d="2500" t2="NO" style="position: absolute; width: 470px; height: 220px; top: 120px; left: 650px;">
                   <img src="<%=request.getContextPath() %>/templates/public/images/a13.jpg" style="position: absolute; width: 445px; height: 300px; top: 0px; left: 0px;" />
                    
                   
                   
                </div>
                <div style="position: absolute; width: 480px; height: 120px; top: 30px; left: 30px; padding: 5px;
                    text-align: left; line-height: 60px; text-transform: uppercase; font-size: 50px;
                        color: #FFFFFF;">HỒ THỊ KIM HUỆ
                </div>
                <div style="position: absolute; width: 480px; height: 120px; top: 300px; left: 30px; padding: 5px;
                    text-align: left; line-height: 36px; font-size: 30px;
                        color: #FFFFFF;">
                       Trường Đại học Bách Khoa - Đại học Đà Nẵng <br />
					   Lớp 12T3<br />
					   MSSV:102120239
                </div>
            </div>
              <div>
                <img u="image" src="<%=request.getContextPath() %>/templates/public/images/1920/purple.jpg" />
                <div u="caption" t="NO" t3="RTT|2" r3="137.5%" du3="3000" d3="500" style="position: absolute; width: 445px; height: 300px; top: 100px; left: 600px;">
                    <img src="<%=request.getContextPath() %>/templates/public/images/fam.jpg" style="position: absolute; width: 445px; height: 300px; top: 0px; left: 0px;" />
                    
                </div>
                <div u="caption" t="RTT|2" r="-75%" du="1600" d="2500" t2="NO" style="position: absolute; width: 470px; height: 220px; top: 120px; left: 650px;">
                   <img src="<%=request.getContextPath() %>/templates/public/images/ny.jpg" style="position: absolute; width: 445px; height: 300px; top: 0px; left: 0px;" />
                    
                   
                   
                </div>
                <div style="position: absolute; width: 480px; height: 120px; top: 30px; left: 30px; padding: 5px;
                    text-align: left; line-height: 60px; text-transform: uppercase; font-size: 50px;
                        color: #FFFFFF;">TRƯƠNG QUANG BẢO HƯNG
                </div>
                <div style="position: absolute; width: 480px; height: 120px; top: 300px; left: 30px; padding: 5px;
                    text-align: left; line-height: 36px; font-size: 30px;
                        color: #FFFFFF;">
                       Trường Đại học Bách Khoa - Đại học Đà Nẵng <br />
					   Lớp 12T4<br />
					   MSSV:102120239
                </div>
            </div>
        </div>
        <!-- bullet navigator container -->
        <div u="navigator" class="jssorb21" style="bottom: 26px; right: 6px;">
            <!-- bullet navigator item prototype -->
            <div u="prototype"></div>
        </div>
       
        <span u="arrowleft" class="jssora21l" style="top: 123px; left: 8px;">
        </span>
        <!-- Arrow Right -->
        <span u="arrowright" class="jssora21r" style="top: 123px; right: 8px;">
        </span>
        <!--#endregion Arrow Navigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">Bootstrap Slider</a>
    		</div>
				<ul>
					<li>
						<a href="https://www.facebook.com/hoangtuan.nhan.3" target="_blank">Facebook</a>
					</li>
					<li>
						<a href="https://www.facebook.com/vinatab.java.oop">Twitter</a>
					</li>
					<li>
						<a href="https://plus.google.com/u/0/116224150844139911881">Googleplus</a>
					</li>
					<li>
						<a href="https://www.youtube.com/" target="_blank">Youtobe</a>
					</li>
					
					
				</ul>
			</div>
		</div>
		<div class="body">
			<div class="section">
				<div class="article">
					
					<h2>Chào mừng bạn ghé thăm website Tuấn Nhân</h2>
					<img src="<%=request.getContextPath() %>/templates/public/images/logo-vinaenter.png" alt="">
					<p>
						Website chia sẻ thông tin, các bài học giá trị, và tất cả những gì mà Tuấn Nhân học được mỗi ngày. 
						Hy vọng đây sẽ là kênh hữu ích để chúng ta cùng kết nối, giao lưu lẫn nhau. <br />
						Các công nghệ mới nhất về CNTT cũng được Tuấn Nhân cập nhật tại website này, chúng ta hãy cũng nhau học tập,
						cùng nhau nghiên cứu để tạo nên một bước đợt phá để ngày hôm nay luôn khác ngay hôm qua :D
					</p>
				</div>
				<div class="aside">
					<b>Những Câu Nói Hay</b>
					<p>
						Nếu bạn luôn buồn phiền, hãy dùng hy vọng để chữa trị; hạnh phúc lớn nhất của nhân loại chính là biết hi vọng
					</p>
					<span class="author">- Khuyết danh</span>
				</div>
			</div>
		</div>
		<div class="footer">
			<div>
				<a href="doctors.html"><img src="<%=request.getContextPath() %>/templates/public/images/friends.jpg" alt=""></a>
				<h3>Quan điểm tình bạn của Tuấn Nhân</h3>
				<p>
					Có một người bạn khăng khít còn hơn là một người anh em ruột.
				</p>
			</div>
			<div>
				<a href="services.html"><img src="<%=request.getContextPath() %>/templates/public/images/life.jpg" alt=""></a>
				<h3>Quan điểm về cuộc sống của Tuấn Nhân</h3>
				<p>
					Hãy sống là chính mình, bình thường nhưng không tầm thường.
				</p>
			</div>
			<div>
				<a href="services.html"><img src="<%=request.getContextPath() %>/templates/public/images/love.jpg" alt=""></a>
				<h3>Quan điểm về tình yêu của Tuấn Nhân</h3>
				<p>
					Cuộc sống mà không có tình yêu thì không còn là cuộc sống nữa.
				</p>
			</div>
		</div>
	</div>
	
	
	<div id="footer">
		<%@include file="/templates/public/inc/footer.jsp" %>
	</div>
</body>
</html>