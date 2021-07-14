<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <style>
       .mapdisp 
       {
           background-image: url(https://maps.googleapis.com/maps/api/staticmap?center=Simsr,+Mumbai&zoom=13&scale=false&size=600x300&maptype=roadmap&key=<API_KEY>&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7CSimsr,+Mumbai);

           width:600px;
       }
   </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>    
  
    <h2><%: Title %>.</h2>
    <address>
        Sarvoday Buddh Vihar Marg,
        <br />
        Vidyanagar, Vidya Vihar East,
        <br />
        Ghatkopar East,
        <br />
        Mumbai, Maharashtra 400 077.
        <br /><br />
        <strong>Contact 📱</strong><br />
        +91 9004 234 635<br />
        +91 8767 874 224

    </address>

    <address>
        <strong>Support ✉</strong>   <a href="mailto:rushabh.shah10@somaiya.edu">rushabh.shah10@somaiya.edu</a><br />
        <strong>Marketing ✉</strong> <a href="mailto:sailesh.y@somaiya.edu">sailesh.y@somaiya.edu</a>
    </address>
    <div class="mapdisp">
        <img width="600" src="https://maps.googleapis.com/maps/api/staticmap?center=Simsr,+Mumbai&zoom=13&scale=false&size=600x300&maptype=roadmap&key=<API_KEY>&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7CSimsr,+Mumbai" alt="Google Map of Simsr, Mumbai">
    </div>
</asp:Content>
