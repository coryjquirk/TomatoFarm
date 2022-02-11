import "./App.css";
import Navbar from "./components/Nav";
import Header from "./components/Header";
import Footer from "./components/Footer";
import ScrollArrow from "./components/ScrollArrow";
import Landing from "./components/Landing";
import FarmMap from "./components/FarmMap";
import Inventory from "./components/Inventory";
import Directory from "./components/Directory";
import Documents from "./components/Documents";
import Handbook from "./components/Handbook";
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
            <Route path="/farmmap" element={<FarmMap />}/>       
            <Route path="/inventory" element={<Inventory />}/>                     
            <Route path="/directory" element={<Directory />}/>              
            <Route path="/documents" element={<Documents />}/>              
            <Route path="/handbook" element={<Handbook />}/>
          </Routes>
        </BrowserRouter>
      </div>
      <ScrollArrow />
    </div>
  );
}

export default App;
