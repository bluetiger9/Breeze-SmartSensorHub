#ifndef __MODEL_JSON_H__
#define __MODEL_JSON_H__

const char recognition_model_string_json[] = {"{"\NumModels"\:1,"\ModelIndexes"\:{"\0"\:"\window_size_2048_f1_score_rank_0"\},"\ModelDescriptions"\:[{"\Name"\:"\window_size_2048_f1_score_rank_0"\,"\ClassMaps"\:{"\1"\:"\BigEarthquake"\,"\2"\:"\Calm"\,"\3"\:"\MediumEarthquake"\,"\4"\:"\SmallEarthquake"\,"\0"\:"\Unknown"\},"\ModelType"\:"\PME"\}]}"};


int recognition_model_string_json_len = sizeof(recognition_model_string_json);

#endif /* __MODEL_JSON_H__ */