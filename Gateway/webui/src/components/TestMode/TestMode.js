import { Grid } from "@material-ui/core";
import { makeStyles, useTheme } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { SensorStream } from "../SensorStream";
import { Results } from "../Results";
import { Record } from "../Record";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
  },
  details: {
    display: "flex",
    flexDirection: "column",
  },
  content: {
    flex: "1 0 auto",
  },
  controls: {
    display: "flex",
    alignItems: "center",
  },

  section1: {
    margin: theme.spacing(3, 2),
  },
}));

const TestMode = (props) => {
  return (
    <Grid container rows spacing={6}>
      {props.streamingMode != "recognition" ? (
        <Grid item xs={8}>
          <SensorStream
            columns={props.columns}
            isConnected={props.isConnected}
          />
        </Grid>
      ) : (
        <Grid item xs={6}>
          <Results />
        </Grid>
      )}
      <Grid item xs={4}>
        <Record
          isCameraConnected={props.isCameraConnected}
          isRecording={props.isRecording}
        />
      </Grid>
    </Grid>
  );
};

export default TestMode;
