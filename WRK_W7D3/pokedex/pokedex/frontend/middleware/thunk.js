const thunk = store => next => action => {
  if(typeof action === 'function'){
    return action(store.dispatch, store.state);
  } else {
    return next(action);
  }
};

export default thunk;
