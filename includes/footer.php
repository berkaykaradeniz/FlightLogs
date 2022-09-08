<script>

$(document).ready(function () {
    $('#flight_logs_table').DataTable({
        processing: true,
        ajax: {
            url: 'api/getFlightLogs.php',
            type: 'POST',
        },
        columns: [
            { data: "id" },
            { data: "airline_code" },
            { data: "schedule" },
            { data: "origin" },      
            { data: "destination" },
            { data: "captain_name" },
            { data: "flight_status" },
        ],
    });
});

</script>

