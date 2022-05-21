import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import FooterComponent from './component/FooterComponent';
import HeaderComponent from './component/HeaderComponent';
import ListSkillComponent from './component/ListSkillComponent';
import ListEmployeeComponent from './component/ListEmployeeComponent';
import WelcomeComponent from './component/WelcomeComponent';

function App() {
  return (
    <div>
      <Router>
          <HeaderComponent />
          <div className="container">
            <Switch>
              <Route path = "/employees" component = {ListEmployeeComponent}></Route>
              <Route path = "/skills" component = {ListSkillComponent}></Route>
              <WelcomeComponent/>
              <ListSkillComponent/>
              <ListEmployeeComponent/>
            </Switch>
          </div>
          <FooterComponent />
      </Router>
    </div>
  );
}

export default App;
