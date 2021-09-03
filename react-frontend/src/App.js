import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import FooterComponent from './component/FooterComponent';
import HeaderComponent from './component/HeaderComponent';
import ListEmployeeComponent from './component/ListEmployeeComponent';

function App() {
  return (
    <div>
      <Router>
          <HeaderComponent />
          <div className="container">
            <Switch>
              <Route path = "/" component = {ListEmployeeComponent}></Route>
              <Route path = "/employees" component = {ListEmployeeComponent}></Route>
              <ListEmployeeComponent/>
            </Switch>
          </div>
          <FooterComponent />
      </Router>
    </div>
  );
}

export default App;
