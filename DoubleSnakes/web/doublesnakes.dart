import 'dart:html';
import 'dart:isolate';
import 'dart:math' as Math;
import 'dart:async';


/*
* HTML5 lightcycles
* copyright (c) 2013 Jason Straughan - JDStraughan.com
* MIT License - http://opensource.org/licenses/MIT
*/


class game {
  
  
  CanvasElement canvas = query("#the-game");
  var context;

  var enemy = {
               'type' : 'program',
               'width' : 16,
               'height' : 16,
               'patern' : 'body2',
               'history' : [],
               'y' : 0,
               'x' : 0,
               'current_direction' : null
  };

  var player = {
                'type': 'user',
                'width': 16,
                'height': 16,
                'patern': 'body',
                'history': [],
                'y' : 0,
                'x' : 0,
                'current_direction': null
  };

  var keys = {
              'up': [38, 87],
              'down': [40, 83],
              'left': [37, 65],
              'right': [39, 68],
              'start_game': [13, 32]
  };

  var lastKey = null;
  var over = false;
  
  
  
  
  falsestart(){
    document.onKeyUp.listen((e) {
      var lastKey = e.keyCode;
      switch(e.keyCode) {
        case 38:
          lastKey = 'up';
          break;
        case 40:
          lastKey = 'down';
          break;
        case 39:
          lastKey = 'right';
          break;
        case 37:
          lastKey = 'left';
          break;
        case 87:
          lastKey = 'up';
          break;
        case 83:
          lastKey = 'down';
          break;
        case 68:
          lastKey = 'right';
          break;
        case 65:
          lastKey = 'left';
          break;
        case 13:
          lastKey = 'start_game';
          break;
        case 32:
          lastKey = 'start_game';
          break;
      }
      if (['up', 'down', 'left', 'right'].indexOf(lastKey) >= 0 && lastKey != inverseDirection()) {
        player['current_direction'] = lastKey;
      } else if (['start_game'].indexOf(lastKey) >= 0 && over) {
        start();
      }
    });
    this.context = canvas.context2D;
    start();
    this.over = true;
    new Timer.periodic(new Duration(milliseconds: 100),
        (t) => loop());
  }
  
  start() {
    this.resetPlayer();
    this.resetEnemy();
    this.over = false;
    player['current_direction'] = "left";
    this.resetCanvas();
  }
  
  stop(cycle) {
    this.over = true;
    context.fillStyle = '#FFFFFF';
    var height2 = (canvas.height / 15);
    context.font = '$height2' + 'px sans-serif';
    context.textAlign = 'center';
    var winner = cycle['type'] == 'program' ? 'gagné' : 'perdu';
    context.fillText('Partie terminée - Vous avez ' + winner, canvas.width/2, canvas.height/2);
    context.fillText('Appuyez sur espace pour continuer.', canvas.width/2, canvas.height/2 + (cycle['height'] * 3));
    cycle['patern'] = "body3";
  }
  
  newLevel() {
    this.resetPlayer();
    this.resetEnemy();
    this.resetCanvas();
  }
  
  resetCanvas() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }
  
  
  resetPlayer() {
    player['x'] = canvas.width - (canvas.width / (player['width'] / 2) + 8);
    player['y'] = (canvas.height / 2) + (player['height'] / 2);
    player['patern'] = 'body';
    player['history'] = [];
    player['current_direction'] = "left";
  }
  
  resetEnemy() {
    enemy['x'] = (canvas.width / (enemy['width'] / 2) - 8);
    enemy['y'] = (canvas.height / 2) + (enemy['height'] / 2);
    enemy['patern'] = 'body2';
    enemy['history'] = [];
    enemy['current_direction'] = "right";
  }
  
  move(cycle, opponent) {
    switch(cycle['current_direction']) {
      case 'up':
        cycle['y'] -= cycle['height'];
        break;
      case 'down':
        cycle['y'] += cycle['height'];
        break;
      case 'right':
        cycle['x'] += cycle['width'];
        break;
      case 'left':
        cycle['x'] -= cycle['width'];
        break;
    }
    if (this.checkCollision(cycle, opponent)) {
      this.stop(cycle);
    }
    var coords = this.generateCoords(cycle);
    cycle['history'].add(coords);
  }
  
  moveEnemy() {
    var random = new Math.Random();
    var advisor = this.enemyPingDirections();
    if (advisor[enemy['current_direction']] < enemy['width'] || (random.nextDouble() * 10).ceil == 5) {
      enemy['current_direction'] = advisor['best'];
    }
    this.move(enemy, player);
  }
  
  enemyPingDirections() {
    var pong = {
      'up': 0,
      'down': 0,
      'left': 0,
      'right': 0
    };
    // Up
    for (var i = enemy['y'] - enemy['height']; i>= 0; i -= enemy['height']) {
      pong['up'] = enemy['y'] - i - enemy['width'];
      if (this.isCollision(enemy['x'], i)) break;
    }
    // Down
    for (var i = enemy['y'] + enemy['height']; i<= canvas.height; i += enemy['height']) {
      pong['down'] = i - enemy['y'] - enemy['width'];
      if (this.isCollision(enemy['x'], i)) break;
    }
    // Left
    for (var i = enemy['x'] - enemy['width']; i>= 0; i -= enemy['width']) {
      pong['left'] = enemy['x'] - i - enemy['width'];
      if (this.isCollision(i, enemy['y'])) break;
    }
    // Right
    for (var i = enemy['x'] + enemy['width']; i<= canvas.width; i += enemy['width']) {
      pong['right'] = i - enemy['x'] - enemy['width'];
      if (this.isCollision(i, enemy['y'])) break;
    }
    var largest = {
      'key': null,
      'value': 0
    };
    for(var j in pong.keys){
        if( pong[j] > largest['value'] ){
            largest['key'] = j;
            largest['value'] = pong[j];
        }
    }
    pong['best'] = largest['key'];
    return pong;
  }

  checkCollision(cycle, opponent) {
    if ((cycle['x'] < (cycle['width'] / 2)) ||
        (cycle['x'] > canvas.width - (cycle['width'] / 2)) ||
        (cycle['y'] < (cycle['height'] / 2)) ||
        (cycle['y'] > canvas.height - (cycle['height'] / 2)) ||
        (cycle['history'].indexOf(this.generateCoords(cycle)) >= 0) ||
        (opponent['history'].indexOf(this.generateCoords(cycle)) >= 0)) {
      return true;
    }
    return false;
  }
  
  isCollision(x,y) {
    var coords = '$x,$y';
    if (x < (enemy['width'] / 2) ||
        x > canvas.width - (enemy['width'] / 2) ||
        y < (enemy['height'] / 2) ||
        y > canvas.height - (enemy['height'] / 2) ||
        enemy['history'].indexOf(coords) >= 0 ||
        player['history'].indexOf(coords) >= 0) {
      return true;
    }
    return false;
  }
  
  generateCoords(cycle) {
    var test1 = cycle['x'];
    var test2 = cycle['y'];
    return '$test1,$test2';
  }
  
  draw(cycle) {
    var img = document.getElementById(cycle['patern']);
    var patern=context.createPattern(img,'repeat');
    
    context.fillStyle = patern;
    context.beginPath();
    context.moveTo(cycle['x'] - (cycle['width'] / 2), cycle['y'] - (cycle['height'] / 2));
    context.lineTo(cycle['x'] + (cycle['width'] / 2), cycle['y'] - (cycle['height'] / 2));
    context.lineTo(cycle['x'] + (cycle['width'] / 2), cycle['y'] + (cycle['height'] / 2));
    context.lineTo(cycle['x'] - (cycle['width'] / 2), cycle['y'] + (cycle['height'] / 2));
    context.closePath();
    context.fill();
  }
  
  void loop() {
    
    if (this.over == false) {
      this.move(player, enemy);
      this.draw(player);
      this.moveEnemy();
      this.draw(enemy);
    }
  }
  
  inverseDirection() {
    switch(player['current_direction']) {
      case 'up':
        return 'down';
        break;
      case 'down':
        return 'up';
        break;
      case 'right':
        return 'left';
        break;
      case 'left':
        return 'right';
        break;
    }
  }
  
  
}

main() {
  new game().falsestart();
}
