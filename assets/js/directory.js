function rhesusTypes() {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "rhesus_types": "rhesus_types"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, rhesus) {
                if (rhesus.id >= 1) {
                    $("#rhesus_types").append("<option value=" + rhesus.id + ">" + rhesus.rhesus_types + "</option>");
                }
            })

        }
    });
}

function bloodGrups() {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "blood_groops": "blood_groops"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#blood_groops").append("<option value=" + blood.id + ">" + blood.blood_groups + "</option>");

            })

        }
    });
}



function bloodGrupsSelect(id) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "blood_groops": "blood_groops"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, blood) {
                if (blood.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#blood_groops").append("<option value=" + blood.id + " " + selected + ">" + blood.blood_groups + "</option>");

            })

        }
    });
}

function doctors(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#doctors").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}

function doctorsSecond(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#doctors-second").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}

function doctorsSpeciliast(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#doctor_specialists").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}




function doctorsAnesthesiologist(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#anesthesiologist").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}


function doctorsSurgery(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#surgeon").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}


function doctorsMedda(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#surgical_nurse").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}

function doctorsAll(id) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            
            "doctors_list_all": "doctors_list_all"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#creator_name").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}

function doctorsAllLab(id) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            
            "doctors_list_all": "doctors_list_all"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#demanding_doctor").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");

            })

        }
    });
}

function AssistantFirst(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#first_assistant").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");
             
            })

        }
    });
}

function AssistantSecond(id,type) {

    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "doctors_list": "doctors_list",
            "id":type
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, doctor) {
                if (doctor.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#second_assistant").append("<option value=" + doctor.id + " " + selected + ">" + doctor.first_name + " " + doctor.last_name + "</option>");
             
            })

        }
    });
}



function visitConditions(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "visit_condition": "visit_condition"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#conditions").append("<option value=" + condition.id + " " + selected + ">" + condition.condition + "</option>");

            })

        }
    });
}

function ExaminationProcedures(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "examination_procedures": "examination_procedures"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#procedure_clinical").append("<option value=" + condition.id + " " + selected + ">" + condition.procedure_name + "</option>");

            })

        }
    });
}



function PsyDiagnoses(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "psy_diagnoses": "psy_diagnoses"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#diagnosis_id").append("<option value=" + condition.id + " " + selected + ">" + condition.diagnosis_type + "</option>");

            })

        }
    });
}

function operationsSpeciality(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_specialty": "get_specialty"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#specialty").append("<option value=" + condition.id + " " + selected + ">" + condition.specialty_types + "</option>");

            })

        }
    });
}


function getVaccines(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_vaccines": "get_vaccines"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#vaccine").append("<option value=" + condition.id + " " + selected + ">" + condition.vaccine_type + "</option>");

            })

        }
    });
}


function getIndications(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_indications": "get_indications"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#indication").append("<option value=" + condition.id + " " + selected + ">" + condition.indications + "</option>");

            })

        }
    });
}

function getMedProducts(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_med_products": "get_med_products"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#product_id").append("<option value=" + condition.id + " " + selected + ">" + condition.products + "</option>");

            })

        }
    });
}

function DiagnosisDesease(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_diagnosis_disease": "get_diagnosis_disease"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#diagnos_disease_id").append("<option value=" + condition.id + " " + selected + ">" + condition.disease_type + "</option>");

            })

        }
    });
}

function DiagnosisDoctor(id, type) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_doctors": "get_doctors"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#" + type).append("<option value=" + condition.id + " " + selected + ">" + condition.name + "</option>");
            })
        }
    });
}


function laboratoryTests(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_laboratory_tests": "get_laboratory_tests"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#Test_code").append("<option value=" + condition.id + " " + selected + ">" + condition.code_name + "</option>");
            })
        }
    });
}


function ProcedureCodeName(id,cure_id) {

    var saxeli =""
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        async:false,
        data: {
            "get_procedure_code_name": "get_procedure_code_name",
            "id":id,
            "cure_id":cure_id
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (item, value) {
                $('#procedure_code').val(value.procedure_code);
                $('#patient_name').val(value.patient_name);
            });

        }
    });

   
   
}

function ProcedureCode(id) {
    $.ajax({
        type: "POST",
        url: "core/data/directory/directories.php",
        data: {
            "get_procedure_code": "get_procedure_code"
        },
        dataType: "html",
        success: function (data) {
            var objects = JSON.parse(data);
            $.each(objects, function (key, condition) {
                if (condition.id == id) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                $("#procedure_code").append(`<option value="${condition.id}" data-name="${condition.procedure_name}" ${selected}>${condition.procedure_code}</option>`);
            })
        }
    });
}




