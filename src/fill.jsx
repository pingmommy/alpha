 import React from 'react';
 import ReactDOM from 'react-dom/client';
 import Alpha from './util/alpha.js';
 import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
 import "./css/fill.css";

 
 class Fill extends Alpha {
	 
	 left = 0;
	 top = 0;
	 zIndex =0;
	 scale =1;
	 
	 constructor () {
		super();	
		this.init(); 
	 }
	 
	 init() {
		 this.left = parseInt(Math.random()*500+400);
		  this.top = 100;
		 /*this.top = parseInt(Math.random()*20+1);*/
		  this.zIndex =0;
		  this.scale =3;
	 }
	 
	 clear() {
		 this.left = 0;
		 this.top = 0;
		 this.zIndex =0;
		 this.scale =1;
	 }
	 
	   /* 되나 안 되나 고정된 값으로 테스트함. 
	   
	    this.left = 700;
		 this.top = 100;*/
	 }
	 
	 
 
 

class App extends React.Component {
	
	constructor(){
		super();
		for(let i=0; i<20; i++){
			this.state.surface[i]=[];
			for(let j=0; j<40;j++){
				let alpha =new Fill();
				this.state.surface[i][j]=alpha;	
			}
					}
			this.init();		
	console.log(this.state.surface);
	}
	
	state = {
		surface:[],
		forecount : 0,
		count: 0,
		ellipse: 0,
		disabled: false,
	}
	
	async fill() {
		
		let zIdex =1;
		
		for(;;){
			
			
			this.state.forecount++;
			
			let alpha = new Fill();
			let a =this.state.surface[alpha.line-1][alpha.column-1];
			
			if(a.fg =='black' && a.bg == 'black') {
				this.state.count++;
				alpha.clear();
				alpha.zIndex = zIdex++;
				this.state.surface[alpha.line-1][alpha.column-1] = alpha;
			
			}		
			
			this.forceUpdate();
			
			await sleep(5);
			
			if(this.state.count == 800){
				this.state.disabled = false;
				this.forceUpdate();
				break;
			}
		}
	}
	
	async timer() {
		for(;;){
			this.state.ellipse++;
			this.forceUpdate();
			await sleep(1000);
			
			if(this.state.count == 800){
				break;
			}
		}
	}
	
	init() {
		
			for(let i=0; i<20; i++){
			for(let j=0; j<40; j++){
				this.state.surface[i][j].fg ='black';
				this.state.surface[i][j].bg ='black';
				this.state.surface[i][j].init();
			}
		}
		
		this.state.forecount=0;
		this.state.count=0;
		this.state.ellipse=0;
		
	}
	
	btnCreate_click(e){
		this.state.disabled = true;	
		
		this.init();
		this.forceUpdate();
		
		this.fill();
		this.timer();
	}
		
	render() {
		return(
			<>
			<div className="flex-center">
			<button disabled={this.state.disabled} onClick={event => this.btnCreate_click(event)} className="shape">START</button>
			<table>
			<thead>
			<tr>
				<th>Forecount</th>
				<th>Count</th>
				<th>Ellipse</th>
			</tr>
			</thead>
			<tbody>
				<tr id='count_tr'>
					<td>{this.state.forecount}</td>
					<td>{this.state.count}</td>
					<td>{this.state.ellipse}</td>
				</tr>
			</tbody>
			</table >
			</div>
			<table id='surface' className='collapse'
/*			<table style={{borderCollapse:'collapse', fontFamily:'monospace',fontSize:'2em'} }*/
			onMouseDown={event=> event.preventDefault()}
			onContextMenu={event => event.preventDefault()}
			>
				<tbody>
				{
					this.state.surface.map((row,k) =>
						<tr key={k}>
						{
							row.map((v,k) =>
							<td key={k} style={{
								color:v.fg, 
								background:v.bg,
								left:v.left,
								top:v.top,
								zIndex:v.zIndex,
								transform:`scale(${v.scale})`
								}}>{v.ch}</td>
						 )}
						
						</tr>
					)
				}
				</tbody>
			</table>
			</>
	)				
 }
}
let root = ReactDOM.createRoot(document.querySelector('#root')) 
root.render(<App/>)
 
 