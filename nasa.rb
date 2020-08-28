require_relative 'request'

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=", "Vgsf3S6dfZxISOHOujUsd1aNwreXiJ2WJ1lcrJlX")


def head

  head = '
<html lang="es">
  <head>
    <meta name="author" content="Wilber Garcia a.k.a H4K1">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" media="all">
    <title>Nasa</title>
  </head>
  <body>
    <h1 class="display-1 font-weigth-bolder p-5 ">Mars Rover Curiosity</h1>
  '
end

def content(data)
  img = "<div class='row container m-auto'>" 
  data.each do |photos|
    photos[1].each do |array|
        img += "
        <div class= 'col-sm-12 col-md-4 text-center foto'>
            <h2 class='h3 p-2'>#{array['camera']['full_name']} <br> <span class='h5 font-weigth-lighter'>(#{array['camera']['name']})</span></h2>
            <a href='#{array['img_src']}' target='_blank'><img width='200px' src='#{array['img_src']}' alt=''></a>
            <p>#{array['earth_date']}</p>
        </div>
        "
    end
  end
  img += "</div>"
  return img 
end

def foot
    foot =
      '
      </body>
          </html>'
end

index = head + content(data) + foot

File.write('index.html', index)
