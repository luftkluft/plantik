import React from "react"
import classes from './app.module.css'

class App extends React.Component {
  render() {
    return (
      <div className={classes.grid}>
        <header className={classes.header}>шапка reset to step6</header>
        <aside className={classes.aside}>тулбар</aside>
        <content className={classes.content}>содержание</content>
        <footer className={classes.footer}>подвал</footer>
      </div>
    );
  }
}

export default App