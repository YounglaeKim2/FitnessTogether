<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--가로넓이는 장치크기에.. 안드로이드 기본값(160dpi) 1로 처리  -->
<meta name="description" content="" />
<!--즐겨찾기시 키워드 (미지정)-->
<meta name="keywords" content="" />
<!--페이지 키워드 (미지정)-->
<title>Fitness Together</title>

<link rel="icon"
	href="<c:url value="/resources/images/photobbs/fav.png"/>"
	type="image/png" sizes="16x16">
<!-- 사이트로고 -->

<link rel="stylesheet"
	href="<c:url value="/resources/css/photobbs/tl-all-in-one.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/photobbs/tl-color.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/photobbs/tl-boots.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/photobbs/lightboxes/tl-lightboxes.css"/>">


</head>

<body>
	<!-- 현 사용자 정보 시작 -->
	<div class="container-fluid">
		<div class="row merged">
			<div class="col-lg-2 col-sm-3">
				<div class="user-avatar">
					<figure>
						<img src="images/resources/user-avatar.jpg" alt="">
						<!-- 작은 프사 -->
					</figure>
				</div>
			</div>

			<div class="col-lg-10 col-sm-9">
				<div class="timeline-info">
					<ul>
						<li class="admin-name">
							<h5>${param.nickname}</h5> <span>내 포스팅</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 현 사용자 정보 끝 -->

	<!-- 좌측 사이드바 시작 -->
	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<div class="col-lg-3">
								<aside class="sidebar static">
									<div class="widget">
										<h4 class="widget-title">소셜</h4>
										<ul class="socials">
											<li class="myposting"><a title=""
												href="/fnt/photoList.do"> <span>내 포스팅</span></a></li>
											<li class="frposting"><a title=""
												href="/fnt/frPhotoList.do"> <span>친구 소식</span></a></li>
											<li class="mapposting"><a title=""
												href="/fnt/mapPhotoList.do"> <span>내 주변 사람들</span></a></li>
										</ul>
									</div>

									<!--바로가기 시작 -->
									<div class="widget">
										<h4 class="widget-title">바로가기</h4>
										<ul class="naves">
											<li><i class="ti-clipboard"></i> <a href="profile.html"
												title="">프로필</a></li>
											<li><i class="ti-mouse-alt"></i> <a href="follow.html"
												title="">팔로우관리</a></li>

										</ul>
									</div>
									<!-- 바로가기 끝 -->

									<!-- 최근 포스팅 시작 -->
									<!-- 임의로 써놓은거에요.. -->
									<div class="widget">
										<h4 class="widget-title">최근 포스팅</h4>
										<ul class="activitiez">
											<li>
												<div class="activity-meta">
													<i>10 hours Ago</i> <span><a href="#" title="">Commented
															on Video posted </a></span>
													<h6>
														by <a href="newsfeed.html">박준희</a>
													</h6>
												</div>
											</li>
											<li>
												<div class="activity-meta">
													<i>30 Days Ago</i> <span><a href="newsfeed.html"
														title="">Posted your status. “하이하이”</a></span>
												</div>
											</li>
											<li>
												<div class="activity-meta">
													<i>2 Years Ago</i> <span><a href="#" title="">Share
															a video on her timeline.</a></span>
													<h6>
														"<a href="newsfeed.html">ㅋㅋㅋㅋㅋㅋ</a>"
													</h6>
												</div>
											</li>
										</ul>
									</div>
									<!-- 최근 포스팅 끝 -->

									<!-- 친구요청 시작 -->
									<div class="widget stick-widget">
										<h4 class="widget-title">친구요청</h4>
										<ul class="followers">
											<li>
												<figure>
													<img src="images/resources/friend-avatar2.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">김길동</a>
													</h4>
													<a href="#" title="" class="underline">친구추가</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar4.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">박길동</a>
													</h4>
													<a href="#" title="" class="underline">친구추가</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar6.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">최길동</a>
													</h4>
													<a href="#" title="" class="underline">친구추가</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar8.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">홍길동</a>
													</h4>
													<a href="#" title="" class="underline">친구추가</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar3.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">이길동</a>
													</h4>
													<a href="#" title="" class="underline">친구추가</a>
												</div>
											</li>
										</ul>
									</div>
									<!-- 친구요청 끝 -->
								</aside>
							</div>
							<!-- 좌측 사이드바 끝 -->

							<!-- 중앙 메인포스트 부분 시작 -->
							<!-- 포스팅 박스 시작 -->
							<div class="col-lg-6">
								<div class="loadMore">
									<div class="central-meta item">
										<div class="new-postbox">
											<figure>
												<img src="images/resources/admin2.jpg" alt="">
											</figure>
											<div class="newpst-input">
												<form method="post">
													<textarea rows="2" placeholder="포스팅 내용을 입력하세요"></textarea>
													<div class="attachments">
														<ul>
															<li><i class="fa fa-music"></i> <label
																class="fileContainer"> <input type="file">
															</label></li>
															<li><i class="fa fa-image"></i> <label
																class="fileContainer"> <input type="file">
															</label></li>
															<li><i class="fa fa-video-camera"></i> <label
																class="fileContainer"> <input type="file">
															</label></li>
															<li><i class="fa fa-camera"></i> <label
																class="fileContainer"> <input type="file">
															</label></li>
															<li>
																<button type="submit">등록하기</button>
															</li>
														</ul>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- 포스팅 박스 끝 -->

									<!-- 중앙 타임라인 시작 -->
									<div class="central-meta item">
										<div class="user-post">
											<div class="friend-info">
												<figure>
													<img src="images/resources/friend-avatar10.jpg" alt="">
												</figure>
												<div class="friend-name">
													<ins>
														<a href="time-line.html" title="">복상일</a>
													</ins>
													<span>published: december,15 2021 20:PM</span>
												</div>
												<div class="description">
													<p>배고프다..</p>
												</div>

												<div class="post-meta">
													<div class="linked-image align-left">
														<a href="#" title=""><img
															src="images/resources/page1.jpg" alt=""></a>
													</div>
													<div class="detail">
														<span>Love Maid - ChillGroves</span>
														<p>Lorem ipsum dolor sit amet, consectetur ipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua...</p>
														<a href="#" title="">www.sample.com</a>
													</div>
													<div class="we-video-info">
														<ul>
															<li><span class="views" data-toggle="tooltip"
																title="views"> <i class="fa fa-eye"></i> <ins>1.2k</ins>
															</span></li>
															<li><span class="comment" data-toggle="tooltip"
																title="Comments"> <i class="fa fa-comments-o"></i>
																	<ins>52</ins>
															</span></li>
															<li><span class="like" data-toggle="tooltip"
																title="like"> <i class="ti-heart"></i> <ins>2.2k</ins>
															</span></li>
															<li><span class="dislike" data-toggle="tooltip"
																title="dislike"> <i class="ti-heart-broken"></i>
																	<ins>200</ins>
															</span></li>
															<li class="social-media">
																<div class="menu">
																	<div class="btn trigger">
																		<i class="fa fa-share-alt"></i>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-html5"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-facebook"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-google-plus"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-twitter"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-css3"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-instagram"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-dribbble"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-pinterest"></i></a>
																		</div>
																	</div>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="central-meta item">
										<div class="user-post">
											<div class="friend-info">
												<figure>
													<img src="images/resources/friend-avatar10.jpg" alt="">
												</figure>
												<div class="friend-name">
													<ins>
														<a href="time-line.html" title="">Janice Griffith</a>
													</ins>
													<span>published: june,2 2018 19:PM</span>
												</div>
												<div class="post-meta">
													<img src="images/resources/user-post.jpg" alt="">
													<div class="we-video-info">
														<ul>

															<li><span class="views" data-toggle="tooltip"
																title="views"> <i class="fa fa-eye"></i> <ins>1.2k</ins>
															</span></li>
															<li><span class="comment" data-toggle="tooltip"
																title="Comments"> <i class="fa fa-comments-o"></i>
																	<ins>52</ins>
															</span></li>
															<li><span class="like" data-toggle="tooltip"
																title="like"> <i class="ti-heart"></i> <ins>2.2k</ins>
															</span></li>
															<li><span class="dislike" data-toggle="tooltip"
																title="dislike"> <i class="ti-heart-broken"></i>
																	<ins>200</ins>
															</span></li>
															<li class="social-media">
																<div class="menu">
																	<div class="btn trigger">
																		<i class="fa fa-share-alt"></i>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-html5"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-facebook"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-google-plus"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-twitter"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-css3"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-instagram"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-dribbble"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-pinterest"></i></a>
																		</div>
																	</div>

																</div>
															</li>
														</ul>
													</div>
													<div class="description">

														<p>
															Curabitur world's most beautiful car in <a href="#"
																title="">#test drive booking !</a> the most beatuiful
															car available in america and the saudia arabia, you can
															book your test drive by our official website
														</p>
													</div>
												</div>
											</div>
											<div class="coment-area">
												<ul class="we-comet">
													<li>
														<div class="comet-avatar">
															<img src="images/resources/comet-1.jpg" alt="">
														</div>
														<div class="we-comment">
															<div class="coment-head">
																<h5>
																	<a href="time-line.html" title="">Jason borne</a>
																</h5>
																<span>1 year ago</span> <a class="we-reply" href="#"
																	title="Reply"><i class="fa fa-reply"></i></a>
															</div>
															<p>we are working for the dance and sing songs. this
																car is very awesome for the youngster. please vote this
																car and like our post</p>
														</div>
														<ul>
															<li>
																<div class="comet-avatar">
																	<img src="images/resources/comet-2.jpg" alt="">
																</div>
																<div class="we-comment">
																	<div class="coment-head">
																		<h5>
																			<a href="time-line.html" title="">alexendra
																				dadrio</a>
																		</h5>
																		<span>1 month ago</span> <a class="we-reply" href="#"
																			title="Reply"><i class="fa fa-reply"></i></a>
																	</div>
																	<p>
																		yes, really very awesome car i see the features of
																		this car in the official website of <a href="#"
																			title="">#Mercedes-Benz</a> and really impressed :-)
																	</p>
																</div>
															</li>
															<li>
																<div class="comet-avatar">
																	<img src="images/resources/comet-3.jpg" alt="">
																</div>
																<div class="we-comment">
																	<div class="coment-head">
																		<h5>
																			<a href="time-line.html" title="">Olivia</a>
																		</h5>
																		<span>16 days ago</span> <a class="we-reply" href="#"
																			title="Reply"><i class="fa fa-reply"></i></a>
																	</div>
																	<p>i like lexus cars, lexus cars are most beautiful
																		with the awesome features, but this car is really
																		outstanding than lexus</p>
																</div>
															</li>
														</ul>
													</li>
													<li>
														<div class="comet-avatar">
															<img src="images/resources/comet-1.jpg" alt="">
														</div>
														<div class="we-comment">
															<div class="coment-head">
																<h5>
																	<a href="time-line.html" title="">Donald Trump</a>
																</h5>
																<span>1 week ago</span> <a class="we-reply" href="#"
																	title="Reply"><i class="fa fa-reply"></i></a>
															</div>
															<p>
																we are working for the dance and sing songs. this video
																is very awesome for the youngster. please vote this
																video and like our channel <i class="em em-smiley"></i>
															</p>
														</div>
													</li>
													<li><a href="#" title="" class="showmore underline">more
															comments</a></li>
													<li class="post-comment">
														<div class="comet-avatar">
															<img src="images/resources/comet-1.jpg" alt="">
														</div>
														<div class="post-comt-box">
															<form method="post">
																<textarea placeholder="Post your comment"></textarea>
																<div class="add-smiles">
																	<span class="em em-expressionless" title="add icon"></span>
																</div>
																<div class="smiles-bunch">
																	<i class="em em---1"></i> <i class="em em-smiley"></i>
																	<i class="em em-anguished"></i> <i
																		class="em em-laughing"></i> <i class="em em-angry"></i>
																	<i class="em em-astonished"></i> <i class="em em-blush"></i>
																	<i class="em em-disappointed"></i> <i
																		class="em em-worried"></i> <i
																		class="em em-kissing_heart"></i> <i class="em em-rage"></i>
																	<i class="em em-stuck_out_tongue"></i>
																</div>
																<button type="submit"></button>
															</form>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="central-meta item">
										<div class="user-post">
											<div class="friend-info">
												<figure>
													<img src="images/resources/friend-avatar10.jpg" alt="">
												</figure>
												<div class="friend-name">
													<ins>
														<a href="time-line.html" title="">Janice Griffith</a>
													</ins>
													<span>published: june,2 2018 19:PM</span>
												</div>
												<div class="post-meta">
													<iframe src="https://player.vimeo.com/video/15232052"
														height="315" webkitallowfullscreen mozallowfullscreen
														allowfullscreen></iframe>
													<div class="we-video-info">
														<ul>

															<li><span class="views" data-toggle="tooltip"
																title="views"> <i class="fa fa-eye"></i> <ins>1.2k</ins>
															</span></li>
															<li><span class="comment" data-toggle="tooltip"
																title="Comments"> <i class="fa fa-comments-o"></i>
																	<ins>52</ins>
															</span></li>
															<li><span class="like" data-toggle="tooltip"
																title="like"> <i class="ti-heart"></i> <ins>2.2k</ins>
															</span></li>
															<li><span class="dislike" data-toggle="tooltip"
																title="dislike"> <i class="ti-heart-broken"></i>
																	<ins>200</ins>
															</span></li>
															<li class="social-media">
																<div class="menu">
																	<div class="btn trigger">
																		<i class="fa fa-share-alt"></i>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-html5"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-facebook"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-google-plus"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-twitter"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-css3"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-instagram"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-dribbble"></i></a>
																		</div>
																	</div>
																	<div class="rotater">
																		<div class="btn btn-icon">
																			<a href="#" title=""><i class="fa fa-pinterest"></i></a>
																		</div>
																	</div>

																</div>
															</li>
														</ul>
													</div>
													<div class="description">

														<p>
															Lonely Cat Enjoying in Summer Curabitur <a href="#"
																title="">#mypage</a> ullamcorper ultricies nisi. Nam
															eget dui. Etiam rhoncus. Maecenas tempus, tellus eget
															condimentum rhoncus, sem quam semper libero, sit amet
															adipiscing sem neque sed ipsum. Nam quam nunc,
														</p>
													</div>
												</div>
											</div>
											<div class="coment-area">
												<ul class="we-comet">
													<li>
														<div class="comet-avatar">
															<img src="images/resources/comet-1.jpg" alt="">
														</div>
														<div class="we-comment">
															<div class="coment-head">
																<h5>
																	<a href="time-line.html" title="">Jason borne</a>
																</h5>
																<span>1 year ago</span> <a class="we-reply" href="#"
																	title="Reply"><i class="fa fa-reply"></i></a>
															</div>
															<p>we are working for the dance and sing songs. this
																video is very awesome for the youngster. please vote
																this video and like our channel</p>
														</div>

													</li>
													<li>
														<div class="comet-avatar">
															<img src="images/resources/comet-2.jpg" alt="">
														</div>
														<div class="we-comment">
															<div class="coment-head">
																<h5>
																	<a href="time-line.html" title="">Sophia</a>
																</h5>
																<span>1 week ago</span> <a class="we-reply" href="#"
																	title="Reply"><i class="fa fa-reply"></i></a>
															</div>
															<p>
																we are working for the dance and sing songs. this video
																is very awesome for the youngster. <i
																	class="em em-smiley"></i>
															</p>
														</div>
													</li>
													<li><a href="#" title="" class="showmore underline">more
															comments</a></li>
													<li class="post-comment">
														<div class="comet-avatar">
															<img src="images/resources/comet-2.jpg" alt="">
														</div>
														<div class="post-comt-box">
															<form method="post">
																<textarea placeholder="Post your comment"></textarea>
																<div class="add-smiles">
																	<span class="em em-expressionless" title="add icon"></span>
																</div>
																<div class="smiles-bunch">
																	<i class="em em---1"></i> <i class="em em-smiley"></i>
																	<i class="em em-anguished"></i> <i
																		class="em em-laughing"></i> <i class="em em-angry"></i>
																	<i class="em em-astonished"></i> <i class="em em-blush"></i>
																	<i class="em em-disappointed"></i> <i
																		class="em em-worried"></i> <i
																		class="em em-kissing_heart"></i> <i class="em em-rage"></i>
																	<i class="em em-stuck_out_tongue"></i>
																</div>
																<button type="submit"></button>
															</form>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- centerl meta -->

							<!-- 우측 배너광고 넣기용 시작 -->
							<div class="col-md-3">
								<aside class="sidebar static">
									<div class="widget">
										<div class="banner medium-opacity bluesh">
											<div class="banner-top">
												<img
													src="<c:url value="/resources/images/photobbs/banner/photo-banner.jpg"/>"
													alt="" class="img-responsive"><i
													class="fa fa-ellipsis-h"></i>
											</div>
										</div>
									</div>
									<!-- 우측 배너광고 넣기용 끝 -->

									<!-- 우측 사이드바 최근 만난친구 시작 -->
									<div class="widget friend-list stick-widget">
										<h4 class="widget-title">최근 만난 친구</h4>
										<div id="searchDir"></div>
										<ul id="people-list" class="friends-request">
											<li>
												<figure>
													<img src="images/resources/friend-avatar.jpg" alt="">
													<span class="status f-online"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">김영래</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="4136282f352433322e2d25243301262c20282d6f222e2c">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar2.jpg" alt="">
													<span class="status f-away"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">박준희</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="3a585b48545f497a5d575b535614595557">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar3.jpg" alt="">
													<span class="status f-off"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">김형철</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="127873617d7c7052757f737b7e3c717d7f">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>
												<figure>
													<img src="images/resources/friend-avatar4.jpg" alt="">
													<span class="status f-off"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">허진서</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="620803110d0c0022050f030b0e4c010d0f">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>

												<figure>
													<img src="images/resources/friend-avatar5.jpg" alt="">
													<span class="status f-online"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">이아영</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="0963687a66676b496e64686065276a6664">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>

												<figure>
													<img src="images/resources/friend-avatar6.jpg" alt="">
													<span class="status f-away"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">김혜란</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="5b313a283435391b3c363a323775383436">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>

												<figure>
													<img src="images/resources/friend-avatar7.jpg" alt="">
													<span class="status f-off"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">조학래</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="472d263428292507202a262e2b6924282a">[email&#160;protected]</a></i>
												</div>
											</li>
											<li>

												<figure>
													<img src="images/resources/friend-avatar5.jpg" alt="">
													<span class="status f-online"></span>
												</figure>
												<div class="friendz-meta">
													<a href="time-line.html">한상민</a> <i><a
														href="https://wpkixx.com/cdn-cgi/l/email-protection"
														class="__cf_email__"
														data-cfemail="7a101b091514183a1d171b131654191517">[email&#160;protected]</a></i>
												</div>
											</li>
										</ul>
										<!-- 우측 사이드바 최근만난친구 끝 -->

										<div class="chat-box">
											<div class="chat-head">
												<span class="status f-online"></span>
												<h6>Bucky Barnes</h6>
												<div class="more">
													<span><i class="ti-more-alt"></i></span> <span
														class="close-mesage"><i class="ti-close"></i></span>
												</div>
											</div>

											<div class="chat-list">
												<ul>
													<li class="me">
														<div class="chat-thumb">
															<img src="images/resources/chatlist1.jpg" alt="">
														</div>
														<div class="notification-event">
															<span class="chat-message-item"> Hi James! Please
																remember to buy the food for tomorrow! I’m gonna be
																handling the gifts and Jake’s gonna get the drinks </span> <span
																class="notification-date"><time
																	datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																	at 8:10pm</time></span>
														</div>
													</li>
													<li class="you">
														<div class="chat-thumb">
															<img src="images/resources/chatlist2.jpg" alt="">
														</div>
														<div class="notification-event">
															<span class="chat-message-item"> Hi James! Please
																remember to buy the food for tomorrow! I’m gonna be
																handling the gifts and Jake’s gonna get the drinks </span> <span
																class="notification-date"><time
																	datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																	at 8:10pm</time></span>
														</div>
													</li>
													<li class="me">
														<div class="chat-thumb">
															<img src="images/resources/chatlist1.jpg" alt="">
														</div>
														<div class="notification-event">
															<span class="chat-message-item"> Hi James! Please
																remember to buy the food for tomorrow! I’m gonna be
																handling the gifts and Jake’s gonna get the drinks </span> <span
																class="notification-date"><time
																	datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																	at 8:10pm</time></span>
														</div>
													</li>
												</ul>
												<form class="text-box">
													<textarea placeholder="Post enter to post..."></textarea>
													<div class="add-smiles">
														<span title="add icon" class="em em-expressionless"></span>
													</div>
													<div class="smiles-bunch">
														<i class="em em---1"></i> <i class="em em-smiley"></i> <i
															class="em em-anguished"></i> <i class="em em-laughing"></i>
														<i class="em em-angry"></i> <i class="em em-astonished"></i>
														<i class="em em-blush"></i> <i class="em em-disappointed"></i>
														<i class="em em-worried"></i> <i
															class="em em-kissing_heart"></i> <i class="em em-rage"></i>
														<i class="em em-stuck_out_tongue"></i>
													</div>
													<button type="submit"></button>
												</form>
											</div>
										</div>
									</div>
								</aside>
							</div>
							<!-- 우측 사이드바 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->