// let my_data = JSON.parse(squares);
let my_data = {
  squares: [
    {
      name: 'stuff',
      links: [
        { name: 'Champlain', url: 'https://my.champlain.edu/' },
        { name: 'Github', url: 'https://github.com/' },
        { name: 'OpenMailBox', url: 'https://www.openmailbox.org/' },
        { name: 'Gmail', url: 'http://www.gmail.com/' },
        { name: 'HackNews', url: 'https://news.ycombinator.com/' },
        { name: 'Teknik', url: 'https://teknik.io/' },
        { name: 'DOX', url: 'https://inteltechniques.com/index.html' },
        { name: 'DOX2', url: 'https://pipl.com/' },
        { name: 'ScratchPad', url: 'file:///home/blackbeard/.scratch_pad.html' }
      ]
    },

    {
      name: '4chan',
      links: [
        { name: '/b/', url: 'http://www.4chan.org/b/' },
        { name: '/g/', url: 'http://www.4chan.org/g/' },
        { name: '/r9k/', url: 'http://www.4chan.org/r9k/' },
        { name: '/co/', url: 'http://www.4chan.org/co/' },
        { name: '/wg/', url: 'http://www.4chan.org/wg/' },
        { name: '/pol/', url: 'http://www.4chan.org/pol/' },
        { name: '8ch', url: 'https://8ch.net/' }
      ]
    },

    {
      name: 'things',
      links: [
        { name: 'WCO', url: 'http://www.watchcartoononline.com/' },
        { name: 'KissAnime', url: 'https://kissanime.ac/' },
        { name: 'DA', url: 'http://deviantart.com' },
        { name: 'unixporn', url: 'https://www.reddit.com/r/unixporn' },
        { name: '.shareit', url: 'http://dotshare.it' },
        { name: 'rice', url: 'https://rizonrice.github.io/resources' },
        { name: 'colors', url: 'https://coolors.co/' }
      ]
    },

    {
      name: 'trackerz',
      links: [
        { name: 'DxDHD', url: 'https://dxdhd.com' },
        { name: 'TLeech', url: 'https://www.torrentleech.org' },
        { name: 'KAT', url: 'https://kickass.cd/full/' },
        { name: 'Demonoid', url: 'https://www.demonoid.pw/' },
        { name: 'Nyya', url: 'https://nyaa.pantsu.cat/' },
        { name: 'Funky', url: 'http://funkytorrents.com' },
        { name: 'Torrenting', url: 'https://www.torrenting.com' },
        { name: 'TheGeeks', url: 'http://thegeeks.click' }
      ]
    },

    {
      name: 'media',
      links: [
        { name: 'LMWT', url: 'http://www.primewire.life/' },
        { name: 'YT', url: 'https://www.youtube.com/' },
        { name: 'LL', url: 'http://www.liveleak.com/' },
        { name: 'horriblesubs', url: 'http://horriblesubs.info/' },
        { name: 'myanimelist', url: 'http://myanimelist.net/' },
        { name: 'anichart', url: 'http://anichart.net/' },
        { name: 'anidb', url: 'http://anidb.net/' },
        { name: 'nyaa.se', url: 'http://nyaa.se/' },
        { name: 'Wallhaven', url: 'http://alpha.wallhaven.cc/' },
        { name: '4walled', url: 'http://4walled.org/' }
      ]
    }
  ]
};
// Pull my link data from external json file

// $.getJSON('./js/my_links.json', function(data){
//   my_data = data;
//   var output = document.getElementById('container');
//   var to_add = document.createDocumentFragment();
//   for(var i = 0; i < my_data.squares.length; i++){
//     var new_div = document.createElement('div');
//     new_div.className = 'sqr';
//     var span = document.createElement('span');
//     var new_content = document.createTextNode(my_data.squares[i].name);
//     span.appendChild(new_content);
//     new_div.appendChild(span);
//     for(var l = 0; l < my_data.squares[i].links.length; l++){
//       var li = document.createElement('li');
//       var link = document.createElement('a');
//       link.setAttribute('href', my_data.squares[i].links[l].url);
//       link.setAttribute('target', '_blank');
//       var text = document.createTextNode(my_data.squares[i].links[l].name);
//       link.appendChild(text);
//       li.appendChild(link);
//       new_div.appendChild(li);
//     }
//
//     //output.innerHTML += my_data.squares[i].name + ' ';
//     to_add.appendChild(new_div);
//   };
//   output.appendChild(to_add);
// });

// Pull hacker news feed.

var hn_url = 'https://hacker-news.firebaseio.com/v0/topstories.json';
var news = document.getElementById('hnews');
var add_news = document.createDocumentFragment();
$.getJSON(hn_url, function(adata) {
  var items = [];
  var ul = document.createElement('ul');
  $.each(adata, function(k, data) {
    if (k < 10) {
      $.getJSON(
        'https://hacker-news.firebaseio.com/v0/item/' + data + '.json',
        function(item) {
          items.push(item);
          // console.log(item.url);
          var hnli = document.createElement('li');
          var hnlink = document.createElement('a');
          if(item.url == undefined){
            hnlink.setAttribute('href', "https://news.ycombinator.com/item?id=" + item.id);
          }else{
            hnlink.setAttribute('href', item.url);
          }
          hnlink.setAttribute('target', '_blank');
          var hntext = document.createTextNode(item.title);
          hnlink.appendChild(hntext);
          hnli.appendChild(hnlink);
          ul.appendChild(hnli);
        }
      );
      add_news.appendChild(ul);
      news.appendChild(add_news);
    }
  });
});

// function sleep(ms) {
//   return new Promise(resolve => setTimeout(resolve, ms));
// }
//
// async function demo() {
//   await sleep(2000);
//   news.appendChild(add_news);
// }
//
// demo();

// My links
var output = document.getElementById('container');
var to_add = document.createDocumentFragment();
for (var i = 0; i < my_data.squares.length; i++) {
  var new_div = document.createElement('div');
  new_div.className = 'sqr';
  var span = document.createElement('span');
  var new_content = document.createTextNode(my_data.squares[i].name);
  span.appendChild(new_content);
  new_div.appendChild(span);
  for (var l = 0; l < my_data.squares[i].links.length; l++) {
    var li = document.createElement('li');
    var link = document.createElement('a');
    link.setAttribute('href', my_data.squares[i].links[l].url);
    link.setAttribute('target', '_blank');
    var text = document.createTextNode(my_data.squares[i].links[l].name);
    link.appendChild(text);
    li.appendChild(link);
    new_div.appendChild(li);
  }

  //output.innerHTML += my_data.squares[i].name + ' ';
  to_add.appendChild(new_div);
}
output.appendChild(to_add);
