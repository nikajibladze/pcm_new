// function getDictionaryVaccine(id) {
//     $.ajax({
//         type: "POST",
//         url: "pages/components/dictionary/data/immunization-registered.php",
//         data: {
//             "id": id
//         },
//         success: function (data) {
//             $("#dictionary-vaccine-content").html(data);

//             $('#dictionary-vaccine-table').dataTable().fnDestroy();
//             $('#dictionary-vaccine-table').DataTable({
//                 "processing": true,
//                 "serverSide": true,
//                 "responsive": true,
//                 "scrollX": false,
//                 "serverMethod": "get",
//                 "autoWidth": false,
//                 "lengthMenu": [10, 20, 30, 40],
//                 "deferRender": true,
//                 "searching": false,
//                 "ajax": {
//                     "url": "core/data/immunization-registered.php"
//                 },
//                 "order": [[0, "desc"]],
//                 "columns": [
//                     { "data": "id" },
//                     { "data": "vaccine_type" },
//                     { "data": "action" },
//                 ],
//                 "language": {
//                     "lengthMenu": "",
//                     "loadingRecords": "მინდინარეობს ჩატვირთვა...",
//                     "zeroRecords": "ინფორმაცია არ არის",
//                     "info": " ",
//                     "infoEmpty": "",
//                     "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
//                     "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
//                     "search": "ძებნა:",
//                     "paginate": {
//                         "first": "პირველი",
//                         "last": "ბოლო",
//                         "next": "შემდეგი",
//                         "previous": "უკან"
//                     }
//                 }
//             });

//             $('#dictionary-vaccine-table tbody').on('dblclick', 'tr', function () {
//                 var table = $('#dictionary-vaccine-table').DataTable();
//                 var data = table.row(this).data();
//                 //addUsers(data.id, 2);
        
//             });
        
        
//             $('#dictionary-vaccine-table tbody').on('click', 'tr', function () {
//                 var table = $('#dictionary-vaccine-table').DataTable();
//                 if ($(this).hasClass('selected')) {
//                     $(this).removeClass('selected');
//                 }
//                 else {
//                     table.$('tr.selected').removeClass('selected');
//                     $(this).addClass('selected');
//                 }
//             });

//         }
//     });
// }
