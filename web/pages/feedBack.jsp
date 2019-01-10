<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/feedBack.css">
<%@ include file="../includes/header.jsp" %>

<script data-cfasync="false" type="text/javascript" src="${pageContext.request.contextPath}/javascript/FormSubmit.js"></script>
<%@ include file="../components/navBar.jsp" %>
<div class="container-contact100">

        <div class="wrap-contact100">
                <form class="gform" method="post" action="https://script.google.com/macros/s/AKfycbw-B0D4lkeVpJETQJNchMUvrrKhhuGFHecOFnbZWho5Vn7fCIU/exec">
				<span class="contact100-form-title">
					Send Us A Message
				</span>

                        <div class="wrap-input100 validate-input" data-validate="Please enter your name">
                                <input class="input100" type="text" name="name" placeholder="Full Name">
                                <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Please enter your email: e@a.x">
                                <input class="input100" type="text" name="email" placeholder="E-mail">
                                <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Please enter your phone">
                                <input class="input100" type="text" name="phone" placeholder="Phone">
                                <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Please enter your message">
                                <textarea class="input100" name="message" placeholder="Your Message"></textarea>
                                <span class="focus-input100"></span>
                        </div>

                        <div class="container-contact100-form-btn">
                                <button class="contact100-form-btn" type="submit">
                                    <span>
                                        <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                                        Send
                                    </span>
                                </button>
                        </div>
                        <div style="display:none; text-align: center;" class="thankyou_message">
                            <p style="font-size: 1.5em; color: #d1cc6e;"><em>Thanks</em> for contacting us! We will get back to you soon!</p>
                        </div>
                </form>
        </div>
</div>

<%@ include file="../includes/footer.jsp" %>






















































