import "./App.css";
import Navbar from "./components/UI/Nav";
import Header from "./components/UI/Header";
import Footer from "./components/UI/Footer";
import ScrollArrow from "./components/UI/ScrollArrow";
import Landing from "./components/UI/Landing";
import Inventory from "./components/Views/Inventory";
import Directory from "./components/Views/Directory";
import Options from "./components/Views/Options";
import { BrowserRouter, Routes, Route } from "react-router-dom";

function App() {
  return (
    <div>
      <Navbar />
      <Header />
      <Footer />
      <div className="fader">
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<Landing />}/>              
            <Route path="/inventory" element={<Inventory />}/>                     
            <Route path="/directory" element={<Directory />}/>
            <Route path="/plots" element={<Directory />}/>
            <Route path="/usermanagement" element={<Directory />}/>
            <Route path="/options" element={<Options />}/>
          </Routes>
        </BrowserRouter>
      </div>
      <ScrollArrow />
    </div>
  );
}

export default App;
