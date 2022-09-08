<?php
    header('Content-Type: application/json; charset=utf-8');

    $con= new mysqli("localhost","root","","flight_logs");
    $con->set_charset("utf8");

    // Check connection
    if ($con -> connect_errno) {
        echo "Failed to connect to MySQL: " . $con -> connect_error;
        exit();
    }

    $sql ="SELECT fl.id as log_id, 
                fL.code as airline_code,
                fl.schedule_date as schedule,
                fl.origin as origin,
                fl.destination as destination,
                fl.status as flight_status, 
                c.full_name as captain_name 
            FROM flight_logs fl
            JOIN captains c 
            on c.id = fl.c_id
    ";
    $query = mysqli_query($con, $sql);

    $row_cnt = $query->num_rows;

    $result = array();
    $result['draw']= 1;
    $result['recordsTotal']= $row_cnt;
    $result['recordsFiltered']= 10;

    while($rows = mysqli_fetch_assoc($query))
    {
        $log_id = $rows['log_id'];
        $airline_code = $rows['airline_code'];
        $schedule = $rows['schedule'];
        $origin = $rows['origin'];
        $destination = $rows['destination'];

        if ($rows['flight_status'])
            $flight_status = "Done";
        else
            $flight_status = "Planned";

        $captain_name = $rows['captain_name'];

        $result['data'][] = array(
            'id' => $log_id, 
            'airline_code' => $airline_code,
            'schedule' => $schedule, 
            'origin' => $origin,
            'flight_status' => $flight_status,
            'captain_name' => $captain_name,
            'destination' => $destination
        );
    }

    echo json_encode($result);
    ?>