<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <meta charset="utf-8">
    <style>
        .p1 {
            color: yellow;
            font-size: 16px;
            font-family: Verdana;
            font-weight: bold;
        }

        .a {
            margin-top: 20px;
            padding: 10px;
        }
        #myCarousel
        {
            
            height:500px;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <div class="container a">

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">

                <div class="item active">
                    <img src="./homeimages/MaryKom.jpg" style="width: 100%; height: 500px;">
                    <div class="carousel-caption">
                        <h3>Sports</h3>
                        <p class="p1">
                            Kom was born in Kangathei village, Moirang Lamkhai in Churachandpur district of rural Manipur in India.She came from a poor family.
                            Her parents, Mangte Tonpa Kom and Mangte Akham Kom were tenant farmers who worked in jhum fields.
                        </p>
                    </div>
                </div>

                <div class="item">
                    <img src="./homeimages/art.jpg" style="width: 100%; height: 500px;">
                    <div class="carousel-caption">
                        <h3>Art</h3>
                        <p class="p1">
                            Tanjore Art are the artworks from the parts Rajasthan, Bengal, Gujarat that portray the fantasies and legends of nearby saints and divinities. 
                            These works of art are narrating pictures.
                        </p>
                    </div>
                </div>

                <div class="item">
                    <img src="./homeimages/archer.jpg" style="width: 100%; height: 500px;">
                    <div class="carousel-caption">
                        <h3>Sports</h3>
                        <p class="p1">
                            Deepika Kumari has been one of the best archers India has ever produced.Living 15 kilometres away from Ranchi with her parents, in Ratu Chatti village, as a child, when she had no means of practising with the proper equipment.
                            She had no choice but to train with mangoes as her target and with stones instead of a bow and arrow.
                        </p>
                    </div>
                </div>

                <div class="item">
                    <img src="./homeimages/dance.jpeg" style="width: 100%; height: 500px;">
                    <div class="carousel-caption">
                        <h3>Dance</h3>
                        <p class="p1">
                            Men and women perform some dances exclusively, while in some performances men and women dance together.
                            On most occasions,the dancers sing themselves,while being accompanied by artists on the instruments.
                            Each form of dance has a specific costume.Most costumes are extraordinary with extensive jewels. 
                            While there are numerous ancient folk and tribal dances, many are constantly being improved.
                        </p>
                    </div>
                </div>

                <div class="item">
                    <img src="./homeimages/hockey.jpg" style="width: 100%; height: 500px;">
                    <div class="carousel-caption">
                        <h3>Sports</h3>
                        <p class="p1">
                            Birendra Lakra has been a reliable name in the Indian men’s hockey team. 
                           Lakra was born in the village of Lachchada in the Sundargarh District of Odisha, on the border of Jharkhand.
                            He was born to a family belonging to an Oraon tribe.
                        </p>
                    </div>
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="row">
        <div>
            <h1>Benefits of Online Shopping</h1>
        </div>
        <div class="col-md-4">
            <h2>Improved Access</h2>
            <p>
                Creating a central, digital repository allows your employees to access information anytime they need it, from wherever they happen to be. Cloud, mobile and web access technology have essentially erased the office boundaries, and version controls ensure that accessed information is current and up-to-date.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Better Security
</h2>
            <p>
                Information management software also ensures that your information is only accessible to those who have permission to read or edit that information, and anti-tamper measures guard against outside threats. Furthermore, with a digital repository and backup storage, you have a cost-effective means of ensuring recovery, should disaster strike.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Increased Productivity
</h2>
            <p>
                By giving your employees better access to information and the tools they need to streamline processes, you’ll wind up increasing their productivity. Reducing tedious administrative tasks and time spent looking for information results in more time for strategic tasks that help your company’s bottom line, which leads to increased productivity.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Faster Reactivity
</h2>
            <p>
                Finally, with all that information at your fingertips, you’ll be able to promptly respond to your customers with the information they request and immediately react to changes in your company’s performance.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Streamlined Management
</h2>
            <p>
                With digital information, you can streamline approval processes and document processing. It also provides an easy way to manage retention schedules for regulated industries, in which different documents must be kept for varying lengths of time.
            </p>

        </div>

        <div class="col-md-4">
            <h2>Greater Visibility
</h2>
            <p>
                High quality information management software includes audit trail features to aid in e-discovery situations, and top-of-the-line platforms are increasingly incorporating business analytics to keep you in touch with your company’s performance indicators.
            </p>

        </div>

        

        

    </div>
</asp:Content>