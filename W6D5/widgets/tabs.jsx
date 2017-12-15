import React from 'react';


class Tabs extends React.Component{
  constructor(props){
    super(props);
    this.toggleActiveClass  = this.toggleActiveClass.bind(this);
    this.state = {tabs: props.tabs, selected: 0};
  }

  toggleActiveClass(e) {
    const clicked = e.currentTarget.id;
    this.setState({selected: parseInt(clicked)});
    
    console.log('hi');
  }

  render(){
    const tabHeader = this.state.tabs.map((el, idx) => (
      <li id={idx} key={idx} onClick = {this.toggleActiveClass} className= {idx===this.state.selected ? "tabHeaderActive" : ""}>
        <h1>
          {el.title}
        </h1>
      </li>
    ));

    const tabBodies = this.state.tabs.map((el,idx) => (
      <li id={idx} key={idx} className= {idx===this.state.selected ? "tabBodiesActive" : ""}>
        <article>{el.content}</article>
      </li>
    ));

    return (
      <div id="tabHolder">
        <ul id='tabHeaders'>
          {tabHeader}
        </ul>
        <ul id='tabBodies'>
          {tabBodies}
        </ul>
      </div>
    );
  }
}


export default Tabs;
