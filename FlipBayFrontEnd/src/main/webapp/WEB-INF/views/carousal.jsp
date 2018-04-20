<!-- 
<html>
<head>
<style>
/* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */

body {
  padding-top: 3rem;
  padding-bottom: 3rem;
  color: #5a5a5a;
}


/* CUSTOMIZE THE CAROUSEL
-------------------------------------------------- */

/* Carousel base class */
.carousel {
  margin-bottom: 4rem;
}

/* Declare heights because of positioning of img element */
.carousel-item {
  height: 100px;
  background-color: #777;
}
.carousel-item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 100px;
}


</style>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="resources/images/slide1.jpg" alt="First slide">
           
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="resources/images/slide2.jpg" alt="Second slide">
            
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="resources/images/slide3.jpg" alt="Third slide">
           
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
</body>
</html> -->


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="resources/images/slide1.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="resources/images/slide2.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="resources/images/slide3.jpg" alt="New york" style="width:100%;">
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

<div class="container">
  <h2>Our Categories</h2>
  <div class="row">
    <div class="col-md-3">
      <div class="thumbnail">
      
          <img src="resources/images/Clothes.png" alt="Lights" style="width:100%">
          <div class="caption">
            <p>All kinds of clothes are available for boys and girls.</p>
          </div>
       </div>
    </div>
    <div class="col-md-3">
      <div class="thumbnail">
          <img height="500px" width="500px" src="resources/images/Electronics.png" alt="Nature" style="width:100%">
          <div class="caption">
            <p>All kinds of electronic items are available here.</p>
          </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="thumbnail">
          <img src="resources/images/Furniture.png" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>All kinds of furniture items are available here.</p>
          </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="thumbnail">
          <img src="resources/images/Books.png" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>All kinds of books are available here.</p>
          </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
