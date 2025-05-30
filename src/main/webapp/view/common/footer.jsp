<div class="footer-basic mt-5">
    <footer>
        <div class="social">
            <a href="#"><i class="icon ion-social-instagram"></i></a>
            <a href="#"><i class="icon ion-social-snapchat"></i></a>
            <a href="#"><i class="icon ion-social-twitter"></i></a>
            <a href="#"><i class="icon ion-social-facebook"></i></a>
        </div>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#"><i class="fa fa-home mr-2"></i>Home</a></li>
            <li class="list-inline-item"><a href="#"><i class="fa fa-briefcase mr-2"></i>Services</a></li>
            <li class="list-inline-item"><a href="#"><i class="fa fa-info-circle mr-2"></i>About</a></li>
            <li class="list-inline-item"><a href="#"><i class="fa fa-file-alt mr-2"></i>Terms</a></li>
            <li class="list-inline-item"><a href="#"><i class="fa fa-shield-alt mr-2"></i>Privacy Policy</a></li>
        </ul>
        <p class="copyright">
            <i class="fa fa-copyright mr-1"></i> Article Manager © ${java.time.Year.now().getValue()}
        </p>
    </footer>
</div>

<style>
    .footer-basic {
        padding: 40px 0;
        background-color: #f8f9fa;
        color: #4b4c4d;
    }

    .footer-basic ul {
        padding: 0;
        list-style: none;
        text-align: center;
        font-size: 18px;
        line-height: 1.6;
        margin-bottom: 0;
    }

    .footer-basic li {
        padding: 0 10px;
    }

    .footer-basic ul a {
        color: inherit;
        text-decoration: none;
        opacity: 0.8;
    }

    .footer-basic ul a:hover {
        opacity: 1;
    }

    .footer-basic .social {
        text-align: center;
        padding-bottom: 25px;
    }

    .footer-basic .social > a {
        font-size: 24px;
        width: 40px;
        height: 40px;
        line-height: 40px;
        display: inline-block;
        text-align: center;
        border-radius: 50%;
        border: 1px solid #ccc;
        margin: 0 8px;
        color: inherit;
        opacity: 0.75;
    }

    .footer-basic .social > a:hover {
        opacity: 0.9;
    }

    .footer-basic .copyright {
        margin-top: 15px;
        text-align: center;
        font-size: 13px;
        color: #aaa;
        margin-bottom: 0;
    }
</style>