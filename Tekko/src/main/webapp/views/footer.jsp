
<script>
	$('#side-menu-toggle').click(function(){
	if($(window).width() < 767){
		$('.submenu').hide();
		if($('.sidenav').hasClass('expand')){
			$('.sidenav').removeClass('expand');
			$('.sidenav').css('width','0px');
			$('#brand-logo,#page-content,#side-menu-toggle').removeClass('sidenav_push');
		}else{
			$('.sidenav').addClass('expand');
			$('.sidenav').css('width','200px');
			$('#brand-logo,#page-content,#side-menu-toggle').addClass('sidenav_push');
			}
	
	}else{
		if($('.sidenav').hasClass('expand')){
			$('.sidenav').removeClass('expand');
			$('.sidenav').css('width','70px');
			$('#brand-logo,#page-content,#side-menu-toggle').removeClass('sidenav_push');
		}else{
			$('.sidenav').addClass('expand');
			$('.sidenav').css('width','200px');
			$('#brand-logo,#page-content,#side-menu-toggle').addClass('sidenav_push');
			}
		}
	});
	$('.has_submenu').on('click',function(){
		var $submenutoshow = $(this).children('.submenu');
		if ($submenutoshow.is(":visible")){
			$submenutoshow.hide(500);
		}else{
			$submenutoshow.slideDown(500)
		}
	});
	</script>
	</body>
</html>