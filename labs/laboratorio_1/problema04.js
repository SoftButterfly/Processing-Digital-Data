    var marker1, marker2;
    var poly, geodesicPoly;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), { zoom: 3 });

        map.controls[google.maps.ControlPosition.TOP_CENTER].push(
            document.getElementById('info'));

        marker1 = new google.maps.Marker({
            map: map,
            draggable: true,
            position: {
                lat: 40.78139796148296,
                lng: -73.96668954467765
            }
        });

        marker2 = new google.maps.Marker({
            map: map,
            draggable: true,
            position: {
                lat: -12.067156558830048,
                lng: -77.0886956434249
            }
        });

        var bounds = new google.maps.LatLngBounds(
            marker1.getPosition(), marker2.getPosition());

        map.setCenter({
          lat: (marker1.position.lat() + marker2.position.lat())*0.5,
          lng: (marker1.position.lng() + marker2.position.lng())*0.5
        })

        google.maps.event.addListener(marker1, 'position_changed', update);
        google.maps.event.addListener(marker2, 'position_changed', update);

        poly = new google.maps.Polyline({
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 3,
            map: map,
        });

        geodesicPoly = new google.maps.Polyline({
            strokeColor: '#CC0099',
            strokeOpacity: 1.0,
            strokeWeight: 3,
            geodesic: true,
            map: map
        });

        update();
    }

    function update() {
        var path = [marker1.getPosition(), marker2.getPosition()];
        poly.setPath(path);
        geodesicPoly.setPath(path);
        var distance = google.maps.geometry.spherical.computeDistanceBetween(path[0], path[1]);
        document.getElementById('distance').value = (distance/1000).toString();
        document.getElementById('latitude1').value = path[0].lat();
        document.getElementById('longitude1').value = path[0].lng();
        document.getElementById('latitude2').value = path[1].lat();
        document.getElementById('longitude2').value = path[1].lng();
    }
