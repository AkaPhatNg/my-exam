import logo from './logo.svg';
import './App.css';
import Navbar from './component/navigation bar'
import Footer from './component/footer'
import Video from './component/video'
function App() {
  return (
    <div className="App">
      <Navbar/>
      <Video/>
      <Footer/>
    </div>
  );
}

export default App;
