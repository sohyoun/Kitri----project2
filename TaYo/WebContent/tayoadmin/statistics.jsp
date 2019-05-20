<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="templet/header.jsp"%>

<!-- 차트 TITLE 영역  -->
<div class="col-sm-12 col-md-12 col-lg-6">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<h4 class="text-center">
				"사용자별 / 연령별" <span class="glyphicon glyphicon-screenshot pull-right"></span>
			</h4>
		</div>
		<!-- 차트 시작 영역 -->
		<div id="chart1" class="shield-chart">
			<div id="shielddw" class="shield-container"
				style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
				<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="612"
					height="400">
				<defs>
				<clipPath id="shielddx">
				<rect rx="0" ry="0" fill="none" x="0" y="0" width="9999"
						height="400" stroke-width="0.000001"></rect></clipPath>
				<clipPath id="shielddy">
				<rect fill="none" x="0" y="0" width="572" height="311"></rect></clipPath>
				<filter id="9f91849d-2018-4001-8364-80c72faa1afe" height="120%">
				<feGaussianBlur in="SourceAlpha" stdDeviation="3"></feGaussianBlur>
				<feComponentTransfer>
				<feFuncA type="linear" slope="0.2"></feFuncA></feComponentTransfer>
				<feMerge>
				<feMergeNode></feMergeNode>
				<feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter></defs>
				<rect rx="0" ry="0" fill="#FFFFFF" x="0" y="0" width="1000"
						height="400" stroke-width="0.000001"></rect>
				<g zIndex="1"></g>
				<g zIndex="1">
				<path fill="none" d="M 32 273.5 L 602 273.5" stroke="#C0C0C0"
						stroke-width="1" stroke-dasharray="none" zIndex="1"></path>
				<path fill="none" d="M 32 196.5 L 602 196.5" stroke="#C0C0C0"
						stroke-width="1" stroke-dasharray="none" zIndex="1"></path>
				<path fill="none" d="M 32 118.5 L 602 118.5" stroke="#C0C0C0"
						stroke-width="1" stroke-dasharray="none" zIndex="1"></path>
				<path fill="none" d="M 32 40.5 L 602 40.5" stroke="#C0C0C0"
						stroke-width="1" stroke-dasharray="none" zIndex="1"></path>
				<path fill="none" d="M 32 351.5 L 602 351.5" stroke="#C0C0C0"
						stroke-width="1" stroke-dasharray="none" zIndex="1"></path></g>
				<g zIndex="2">
				<path fill="none" d="M 186.5 351 L 186.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 327.5 351 L 327.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 469.5 351 L 469.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 45.5 351 L 45.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 116.5 351 L 116.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 257.5 351 L 257.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 398.5 351 L 398.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 539.5 351 L 539.5 357" stroke="#636363"
						stroke-width="1"></path>
				<path fill="none" d="M 32 351.5 L 602 351.5" stroke="#636363"
						stroke-width="1" zIndex="7" visibility="visible"></path></g>
				<g zIndex="2"></g>
				<g zIndex="3">
				<g visibility="visible" zIndex="0.1" transform="translate(32,40)"
						clip-path="url(#shielddy)">
				<rect fill="#1E98E4" x="6" y="257" width="17" height="54"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="34" y="183" width="17" height="128"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="62" y="175" width="17" height="136"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="90" y="175" width="17" height="136"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="119" y="179" width="17" height="132"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="147" y="206" width="17" height="105"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="175" y="304" width="17" height="7"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="203" y="191" width="17" height="120"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="231" y="218" width="17" height="93"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="260" y="171" width="17" height="140"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="288" y="280" width="17" height="31"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="316" y="214" width="17" height="97"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="344" y="249" width="17" height="62"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="373" y="160" width="17" height="151"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="401" y="137" width="17" height="174"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="429" y="296" width="17" height="15"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="457" y="210" width="17" height="101"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="486" y="152" width="17" height="159"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="514" y="253" width="17" height="58"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect>
				<rect fill="#1E98E4" x="542" y="210" width="17" height="101"
						stroke-width="0.000001" stroke="#FFFFFF" rx="0" ry="0"></rect></g>
				<g visibility="visible" zIndex="0.1" transform="translate(32,40)"></g>
				<g visibility="visible" zIndex="0.1" transform="translate(32,40)"
						clip-path="url(#shielddy)">
				<path fill="none"
						d="M 14.115898959881129 81.6 L 42.34769687964339 182.7 L 70.57949479940564 124.4 L 98.81129271916791 70 L 127.04309063893015 128.3 L 155.2748885586924 151.6 L 183.50668647845467 85.5 L 211.73848439821694 225.5 L 239.97028231797918 178.8 L 268.2020802377414 178.8 L 296.43387815750367 229.4 L 324.66567607726597 93.3 L 352.8974739970282 81.6 L 381.12927191679046 174.9 L 409.36106983655276 105 L 437.592867756315 198.3 L 465.82466567607725 128.3 L 494.0564635958395 136.1 L 522.2882615156018 62.2 L 550.520059435364 147.7"
						stroke="#FFC500" stroke-width="3" zIndex="1"></path></g>
				<g visibility="visible" zIndex="0.1" transform="translate(32,40)"
						clip-path="none">
				<path fill="#FFC500"
						d="M 550.520059435364 144.7 C 554.516059435364 144.7 554.516059435364 150.7 550.520059435364 150.7 C 546.524059435364 150.7 546.524059435364 144.7 550.520059435364 144.7 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 522.2882615156018 59.2 C 526.2842615156018 59.2 526.2842615156018 65.2 522.2882615156018 65.2 C 518.2922615156018 65.2 518.2922615156018 59.2 522.2882615156018 59.2 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 494.0564635958395 133.1 C 498.05246359583947 133.1 498.05246359583947 139.1 494.0564635958395 139.1 C 490.0604635958395 139.1 490.0604635958395 133.1 494.0564635958395 133.1 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 465.82466567607725 125.30000000000001 C 469.8206656760772 125.30000000000001 469.8206656760772 131.3 465.82466567607725 131.3 C 461.82866567607726 131.3 461.82866567607726 125.30000000000001 465.82466567607725 125.30000000000001 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 437.592867756315 195.3 C 441.588867756315 195.3 441.588867756315 201.3 437.592867756315 201.3 C 433.596867756315 201.3 433.596867756315 195.3 437.592867756315 195.3 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 409.36106983655276 102 C 413.35706983655274 102 413.35706983655274 108 409.36106983655276 108 C 405.3650698365528 108 405.3650698365528 102 409.36106983655276 102 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 381.12927191679046 171.9 C 385.12527191679044 171.9 385.12527191679044 177.9 381.12927191679046 177.9 C 377.1332719167905 177.9 377.1332719167905 171.9 381.12927191679046 171.9 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 352.8974739970282 78.6 C 356.8934739970282 78.6 356.8934739970282 84.6 352.8974739970282 84.6 C 348.90147399702823 84.6 348.90147399702823 78.6 352.8974739970282 78.6 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 324.66567607726597 90.3 C 328.66167607726595 90.3 328.66167607726595 96.3 324.66567607726597 96.3 C 320.669676077266 96.3 320.669676077266 90.3 324.66567607726597 90.3 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 296.43387815750367 226.4 C 300.42987815750365 226.4 300.42987815750365 232.4 296.43387815750367 232.4 C 292.4378781575037 232.4 292.4378781575037 226.4 296.43387815750367 226.4 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 268.2020802377414 175.8 C 272.1980802377414 175.8 272.1980802377414 181.8 268.2020802377414 181.8 C 264.20608023774145 181.8 264.20608023774145 175.8 268.2020802377414 175.8 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 239.97028231797918 175.8 C 243.9662823179792 175.8 243.9662823179792 181.8 239.97028231797918 181.8 C 235.97428231797917 181.8 235.97428231797917 175.8 239.97028231797918 175.8 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 211.73848439821694 222.5 C 215.73448439821695 222.5 215.73448439821695 228.5 211.73848439821694 228.5 C 207.74248439821693 228.5 207.74248439821693 222.5 211.73848439821694 222.5 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 183.50668647845467 82.5 C 187.50268647845468 82.5 187.50268647845468 88.5 183.50668647845467 88.5 C 179.51068647845466 88.5 179.51068647845466 82.5 183.50668647845467 82.5 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 155.2748885586924 148.6 C 159.2708885586924 148.6 159.2708885586924 154.6 155.2748885586924 154.6 C 151.2788885586924 154.6 151.2788885586924 148.6 155.2748885586924 148.6 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 127.04309063893015 125.30000000000001 C 131.03909063893016 125.30000000000001 131.03909063893016 131.3 127.04309063893015 131.3 C 123.04709063893016 131.3 123.04709063893016 125.30000000000001 127.04309063893015 125.30000000000001 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 98.81129271916791 67 C 102.8072927191679 67 102.8072927191679 73 98.81129271916791 73 C 94.81529271916791 73 94.81529271916791 67 98.81129271916791 67 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 70.57949479940564 121.4 C 74.57549479940563 121.4 74.57549479940563 127.4 70.57949479940564 127.4 C 66.58349479940564 127.4 66.58349479940564 121.4 70.57949479940564 121.4 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 42.34769687964339 179.7 C 46.34369687964339 179.7 46.34369687964339 185.7 42.34769687964339 185.7 C 38.351696879643384 185.7 38.351696879643384 179.7 42.34769687964339 179.7 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path>
				<path fill="#FFC500"
						d="M 14.115898959881129 78.6 C 18.111898959881128 78.6 18.111898959881128 84.6 14.115898959881129 84.6 C 10.119898959881128 84.6 10.119898959881128 78.6 14.115898959881129 78.6 Z"
						stroke="#FFC500" stroke-width="2" visibility="inherit"></path></g></g>
				<path fill="none" d="M 582.5 40 L 582.5 351" stroke-width="2"
						stroke="#999999" zIndex="3" visibility="hidden"></path>
				<text x="306" y="25"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:16px;color:#4B4B4B;top:10;fill:#4B4B4B;"
						text-anchor="middle" zIndex="4">
				<tspan x="306">Performance Data</tspan></text>
				<g zIndex="7" transform="translate(238,373)">
				<g zIndex="1" clip-path="url(#shielddx)">
				<g>
				<g zIndex="1" transform="translate(8,3)">
				<path fill="#1E98E4" d="M 1 6 L 11 6 11 16 1 16 Z"
						style="cursor:pointer;" stroke="#1E98E4" stroke-width="0.000001"></path>
				<text x="17" y="15"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:12px;cursor:pointer;color:#3E576F;fill:#3E576F;"
						text-anchor="start" zIndex="2">
				<tspan x="17">Achieved</tspan></text></g>
				<g zIndex="1" transform="translate(83.6875,3)">
				<path fill="#FFC500" d="M 1 6 L 11 6 11 16 1 16 Z"
						style="cursor:pointer;" stroke="#FFC500" stroke-width="0.000001"></path>
				<text x="17" y="15"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:12px;cursor:pointer;color:#3E576F;fill:#3E576F;"
						text-anchor="start" zIndex="2">
				<tspan x="17">Target</tspan></text></g></g></g></g>
				<g zIndex="7">
				<text x="46.11589895988113" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="46.11589895988113">0</tspan></text>
				<text x="187.2748885586924" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="187.2748885586924">5</tspan></text>
				<text x="328.43387815750367" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="328.43387815750367">10</tspan></text>
				<text x="469.592867756315" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="469.592867756315">15</tspan></text>
				<text x="116.69539375928676" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="116.69539375928676">2.50</tspan></text>
				<text x="257.85438335809806" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="257.85438335809806">7.50</tspan></text>
				<text x="399.01337295690934" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="399.01337295690934">12.50</tspan></text>
				<text x="540.1723625557206" y="368"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="middle" visibility="visible">
				<tspan x="540.1723625557206">17.50</tspan></text></g>
				<g zIndex="7">
				<text x="24" y="357.6"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;width:265px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="end" visibility="visible">
				<tspan x="24">0</tspan></text>
				<text x="24" y="279.85"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;width:265px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="end" visibility="visible">
				<tspan x="24">20</tspan></text>
				<text x="24" y="202.1"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;width:265px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="end" visibility="visible">
				<tspan x="24">40</tspan></text>
				<text x="24" y="124.35"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;width:265px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="end" visibility="visible">
				<tspan x="24">60</tspan></text>
				<text x="24" y="46.6"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:11px;width:265px;color:#636363;line-height:14px;fill:#636363;"
						text-anchor="end" visibility="visible">
				<tspan x="24">80</tspan></text></g>
				<text x="37" y="60"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:16px;cursor:pointer;color:#999999;fill:#999999;"
						text-anchor="start" zIndex="8">
				<tspan x="37">??</tspan></text>
				<text x="597" y="60"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:16px;cursor:pointer;color:#999999;fill:#999999;"
						text-anchor="end" zIndex="8">
				<tspan x="597"></tspan></text>
				<text x="37" y="346"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:16px;cursor:pointer;color:#999999;fill:#999999;"
						text-anchor="start" zIndex="8">
				<tspan x="37"></tspan></text>
				<text x="597" y="346"
						style="font-family:Segoe UI, Tahoma, Verdana, sans-serif;font-size:16px;cursor:pointer;color:#999999;fill:#999999;"
						text-anchor="end" zIndex="8">
				<tspan x="597"></tspan></text>
				<g zIndex="9">
				<g visibility="visible" zIndex="1" transform="translate(32,40)"
						clip-path="url(#shielddy)">
				<rect fill="rgb(192,192,192)" x="6" y="257" width="17" height="54"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="34" y="183" width="17" height="128"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="62" y="175" width="17" height="136"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="90" y="175" width="17" height="136"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="119" y="179" width="17"
						height="132" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="147" y="206" width="17"
						height="105" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="175" y="304" width="17" height="7"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="203" y="191" width="17"
						height="120" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="231" y="218" width="17" height="93"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="260" y="171" width="17"
						height="140" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="288" y="280" width="17" height="31"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="316" y="214" width="17" height="97"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="344" y="249" width="17" height="62"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="373" y="160" width="17"
						height="151" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="401" y="137" width="17"
						height="174" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="429" y="296" width="17" height="15"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="457" y="210" width="17"
						height="101" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="486" y="152" width="17"
						height="159" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="514" y="253" width="17" height="58"
						isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect>
				<rect fill="rgb(192,192,192)" x="542" y="210" width="17"
						height="101" isTracker="1558276902196" fill-opacity="0.0001"
						visibility="visible" style=""></rect></g>
				<g visibility="visible" zIndex="1" transform="translate(32,40)">
				<path fill="none"
						d="M 4.115898959881129 81.6 L 14.115898959881129 81.6 L 42.34769687964339 182.7 L 70.57949479940564 124.4 L 98.81129271916791 70 L 127.04309063893015 128.3 L 155.2748885586924 151.6 L 183.50668647845467 85.5 L 211.73848439821694 225.5 L 239.97028231797918 178.8 L 268.2020802377414 178.8 L 296.43387815750367 229.4 L 324.66567607726597 93.3 L 352.8974739970282 81.6 L 381.12927191679046 174.9 L 409.36106983655276 105 L 437.592867756315 198.3 L 465.82466567607725 128.3 L 494.0564635958395 136.1 L 522.2882615156018 62.2 L 550.520059435364 147.7 L 560.520059435364 147.7"
						isTracker="true" stroke-linejoin="bevel" visibility="visible"
						stroke-opacity="0.0001" stroke="rgb(192,192,192)"
						stroke-width="23" style=""></path></g></g></svg>
			</div>
			<div class="shield-tooltip"
				style="pointer-events: none; display: none; top: 174px; left: 435px;">
				<div class="shield-tooltip-header">17</div>
				<div class="shield-tooltip-value">
					<span>Achieved</span>: 41
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 끝 영역 -->

<!-- 차트 시작 영역  -->
<div class="col-sm-12 col-md-12 col-lg-6">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<h4 class="text-center">
				"지역별" <span class="glyphicon glyphicon-screenshot pull-right"></span>
			</h4>
		</div>
		<div id="chart1" class="shield-chart"></div>
	</div>
</div>
<!-- 끝 영역 -->

<%@include file="templet/footer.jsp"%>