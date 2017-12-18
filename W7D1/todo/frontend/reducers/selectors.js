export const allTodos = (todos) => {
  return Object.keys(todos).map((key) => {
    return todos[key];
  });
};
