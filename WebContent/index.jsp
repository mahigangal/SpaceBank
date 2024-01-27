<!DOCTYPE html>
<html lang="en">

<head>
    <title>Spacebank</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Titillium Web', sans-serif;
            height: 100vh;
            overflow: hidden;
            background-color: #000;
            cursor: default; /* Default cursor style */
        }

        .background-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('<%= request.getContextPath() %>/img/Space.jpg');
            background-size: cover;
            background-position: center;
            z-index: -1;
        }

        .container {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            color: #fff;
            width: 100%;
        }

        .spacecraft {
            position: absolute;
            cursor: pointer;
            transition: transform 0.3s ease;
            width: 30px; /* Adjusted spacecraft size */
            max-width: 100%; /* Added max-width property for image */
        }

        h1 {
            font-family: 'Bangers', cursive;
            text-align: center;
            color: #fff;
            font-size: 3em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            white-space: nowrap;
            overflow: hidden;
            border-right: 2px solid #fff;
            animation: typing 3s steps(15, end);
            display: inline-block;
        }

        .cursor-hidden {
            cursor: none; /* Hide the cursor */
        }

        @keyframes typing {
            from {
                width: 0;
            }
            to {
                width: 100%;
            }
        }

        .spacecraft:hover {
            transform: scale(1.1);
        }
    </style>
</head>

<body>
    <!-- Seven spacecraft images -->
    <!-- Adjust top and left values for each spacecraft to position them uniquely -->
    <div class="spacecraft" id="spacecraft1" style="top: 30%; left: 0.1%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>
     
    <div class="spacecraft" id="spacecraft1" style="top: 7%; left: 15%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>
   
    <div class="spacecraft" id="spacecraft1" style="top: 8%; left: 40%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>
    
    <div class="spacecraft" id="spacecraft1" style="top: 20%; left: 70%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>
    
    <div class="spacecraft" id="spacecraft1" style="top: 55%; left: 65%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>
    
    <div class="spacecraft" id="spacecraft1" style="top: 60%; left: 31%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>

    <div class="spacecraft" id="spacecraft1" style="top: 60%; left: 5%;" onmouseover="showSpacecraftName('Spacecraft 1')" onmouseout="hideSpacecraftName()">
        <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft 1"  width="500" height="300">
    </div>
    
    <!-- Repeat similar divs for other spacecraft -->

    <div class="background-container"></div>
    <div class="container">
        <h1>Welcome to Space Bank</h1>
    </div>

    <script src="scripts.js"></script>
    <script>
        // Add event listener to hide cursor after animation
        document.querySelector('.container h1').addEventListener('animationend', function () {
            
        });
    </script>
</body>

</html>