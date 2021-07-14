<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

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
            <h2>Convenience</h2>
            <p>
                Shopping online is convenient. You don’t need to get dressed and drive to your favorite store. You can easily visit their website, find the product you want and buy it without getting out of your pyjamas.Shopping online allows you to buy things without hurting your schedule.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Better Prices</h2>
            <p>
                The vast majority of online stores offer prices that are much lower than what you will find at a physical store. There are a few reasons for this. The first is because many people use the Internet to find cheaper items. Online business owners understand this. They will usually reduce their profit margin to get more customers.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Comparisons</h2>
            <p>
                Companies display the whole range of products offered by them to attract customers with different tastes and needs. This enables the buyers to choose from a variety of models after comparing the finish, features and price of the products on display, Sometimes, price comparisons are also available online.
            </p>

        </div>

    </div>
</asp:Content>