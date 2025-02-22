const SafetyAlerts = require('../models/SafetyAlerts');

//Create Safety alerts
exports.createSafetyAlerts = async(req,res) => {
    try{
        const{title, description} = req.body;
        const safetyAlerts = new SafetyAlerts({
            title,
            description,
            createdBy: req.userid,
        });
        await safetyAlerts.save();
        res.status(201).json({message:"Safety  Alert Created successfully!"});
    }catch(error){
        console.error(error);
        res.status(500).json({message:"Server Error"});
    }
};

//display safety alerts
exports.getSafetyAlerts = async(req,res) => {
    try{
        const safetyAlerts = await SafetyAlerts.find().sort({createdAt:-1}).populate('createdBy','name');
        res.json(safetyAlerts);
    }catch(error){
        console.error(error);
        res.status(500).json({message:"Server Error"});
    }
};

//delete safety alert
exports.deleteSafetyAlerts = async(req,res) => {
    try{
        const{id} = req.params;
        await SafetyAlerts.findByIdAndDelete(id);
        res.json({message: "Safety Alert deleted succuessfully!"});
    }catch(error){
        console.error(error);
        res.status(500).json({message:"Server Error"});
        
    }
};