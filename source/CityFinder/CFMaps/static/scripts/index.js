function initMap(dictLL) {
    const myLatLng = dictLL;
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 4,
      center: myLatLng,
    });
  
    new google.maps.Marker({
      position: myLatLng,
      map,
      title: "city",
    });
  }
  
  window.initMap = initMap;
  