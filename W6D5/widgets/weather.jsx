import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = { location: null, weather:null };
    this.getWeather = this.getWeather.bind(this);
    navigator.geolocation.getCurrentPosition( (position) => {
      this.setState({ location: position });
      this.getWeather();
    });
  }

  getWeather(){
    const lat = this.state.location.coords.latitude;
    const long = this.state.location.coords.longitude;
    const request = new XMLHttpRequest();
    request.open('GET',`http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=bcb83c4b54aee8418983c2aff3073b3b`, true);
    request.onload = function(){
      if(request.status >= 200 && request.status < 400){
        this.setState({weather: JSON.parse(request.response)});
      }
    }.bind(this);
    request.send();
  }


  render(){
    if(this.state.weather){
      return(
        <main id='weather'>
          <h1>{this.state.weather.name}</h1>
          <h1>{Math.round(this.state.weather.main.temp - 273)} Centigrade</h1>
        </main>
      );
      } else {
        return (
        <main id='weather'>
          getting weather
        </main>
      );
    }
  }
}








export default Weather;
