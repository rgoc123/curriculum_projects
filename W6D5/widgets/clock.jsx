import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);
    this.intervalId = null;
  }

  tick(){
    this.setState({time: new Date()});
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  render() {
    let time = this.state.time;
    return (
      <div id='clock'>
        <h1>Clock</h1>
        <h1 className='clock'>Time: <span>{`${time.getUTCFullYear()}:${time.getUTCMonth()}:${time.getUTCDate()}:${time.getHours()}:${time.getMinutes()}:${time.getSeconds()}`}</span></h1>
      </div>

    );
  }

}

export default Clock;
