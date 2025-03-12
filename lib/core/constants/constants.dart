import 'package:shared_preferences/shared_preferences.dart';

const String QURAN = 'quran_';
const String HADIS = 'hadis_';
const String DOA = 'doa_';
const String MESSAGE = 'message';
const String STATUSCODE = 'statuscode';
const String CITY = 'city';

const SHOLLU = 'DOMAN_SHOLLU';
const SURAH = 'LIST_SURAH';
const READQURAN = 'QURAN';
const HADISLIST = 'HADIS_LIST';
const ADHAN = 'AL_ADHAN';
const DOAA = 'DOA_LIST';

const schedule = '/sholat/jadwal/1301';
const surah = '/api/surat/';
const detailSurah = '/surahs/';
const hadis = '/books/';
const currentTime = '/v1/currentTimestamp?zone=Asia/Jakarta';
const prayer = '/v1/timings/';
const doa = '/api/';

late SharedPreferences logg;
