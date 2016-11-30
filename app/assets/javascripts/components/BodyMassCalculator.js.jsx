var BodyMassCalculator = React.createClass({
    KILOGRAM: "kg",
    MILIGRAM: "ml",
    METERS: 'm',
    CENTIMETERS: 'cm',
    getInitialState: function () {
        return {weight: 0.0, height: 0.0, weight_unit: this.KILOGRAM, height_unit: this.METERS};
    },
    handleInputChange: function (event) {
        var inputvalue = {};
        inputvalue[event.target.name] = event.target.value;
        this.setState(inputvalue);
    },
    calculateBodyMassIndex: function () {
        var weightKg,heigthMts;
        if(this.state.height === 0){
            return 0;
        }
        if(this.state.weight_unit === this.KILOGRAM){
            weightKg = this.state.weight;
        }else if(this.state.weight_unit === this.MILIGRAM){
            weightKg = this.state.weight / 1000;
        }
        if(this.state.height_unit === this.METERS){
            heigthMts = this.state.height;
        }else{
            heigthMts = this.state.height / 100;
        }
        return weightKg / (heigthMts * heigthMts);
    },
    getBOICategory: function (body_mass_index) {
        if(body_mass_index <= 15){
            return "Very severely underweight";
        }else if(body_mass_index <= 16){
            return "Severely underweight";
        }else if(body_mass_index <= 18.5){
            return "Underweight";
        }else if(body_mass_index <= 25){
            return "Normal (healthy weight)"
        }else if(body_mass_index <= 30){
            return "Overweight";
        }else if(body_mass_index <= 35){
            return "Obese Class I (Moderately obese)"
        }else if(body_mass_index <= 40){
            return "Obese Class II (Severely obese)"
        }else{
            return "Obese Class III (Very severely obese";
        }
    },
    render: function(){

        var body_mass_index = this.calculateBodyMassIndex();
        var body_mass_category = this.getBOICategory(body_mass_index);
        return (<div>
            <div className=" panel panel-primary">
                <div className="panel-heading">
                    <h4>Calculator</h4>
                </div>
                <div className="panel-body">
                    <div className="input-group">
                        <span className="input-group-addon">Height</span>
                        <input value={this.state.height} type="number" onChange={this.handleInputChange} className="form-control" name="height" placeholder="0.00"/>
                        <span className="input-group-addon">{this.state.height_unit}</span>
                    </div>
                    <label className="radio-inline">
                        <input type="radio" name="height_unit" onChange={this.handleInputChange}  value={this.METERS} checked={this.state.height_unit === this.METERS} /> Meters
                    </label>
                    <label className="radio-inline">
                        <input type="radio" name="height_unit" onChange={this.handleInputChange}  value={this.CENTIMETERS} checked={this.state.height_unit === this.CENTIMETERS} /> Centimeters
                    </label>

                    <br/> <br/>


                    <div className="input-group">
                        <span className="input-group-addon">Weight</span>
                        <input value={this.state.weight} onChange={this.handleInputChange} type="number" className="form-control" name="weight" placeholder="0.00"/>
                        <span className="input-group-addon">{this.state.weight_unit}</span>
                    </div>
                    <label className="radio-inline">
                        <input type="radio" name="weight_unit" onChange={this.handleInputChange}  value={this.KILOGRAM} checked={this.state.weight_unit === this.KILOGRAM} /> Kilogram
                    </label>
                    <label className="radio-inline">
                        <input type="radio" name="weight_unit" onChange={this.handleInputChange}  value={this.MILIGRAM} checked={this.state.weight_unit === this.MILIGRAM} /> Miligram
                    </label>


                    <h4>Body mass</h4>
                    Body Mass Index: {body_mass_index.toFixed(2)}
                    <br/>
                    Category: {body_mass_category}
                </div>
            </div>

        </div>)
    }
});