import React from 'react';

class TodoForm extends React.Component{
  constructor(props){
    super(props);
    this.state = { title: '', body: '', done: false };
    this.handleTitle = this.handleInput.bind(this);
    this.handleBody = this.handleDone.bind(this);
    this.addTodo = this.addTodo.bind(this);
  }

  handleInput(type){
    return (e) => {
      this.setState({[type]: e.target.value});
    };
  }

  handleDone(boolean){
    return () => {
      this.setState({done: boolean});
    };
  }

  uniqueId() {
    return new Date().getTime();
  }

  addTodo(e) {
    e.preventDefault();
    let newTodo = {
                id: this.uniqueId(),
                title: this.state.title,
                body: this.state.body,
                done: this.state.done};
    this.props.receiveTodo(newTodo);
    this.setState({ title: '', body: '', done: false });
  }

  render(){
    return (
      <form onSubmit={this.addTodo}>
        <label>Title <br></br>
          <input onChange={this.handleInput("title")} type='text' value={this.state.title}></input>
        </label>
        <br></br>

        <label>Body <br></br>
          <textarea onChange={this.handleInput("body")} value={this.state.body}></textarea>
          <br></br>
        </label>

        <label>True
          <input type='radio' checked={ this.state.done } value='true' onChange={this.handleDone(true)}></input>
        </label>

        <label>False
          <input type='radio' checked={ !this.state.done } value='false' onChange={this.handleDone(false)}></input>
        </label>

        <input type='submit'/>
      </form>
    );
  }
}

export default TodoForm;
